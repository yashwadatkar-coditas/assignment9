import 'dart:convert';

import 'package:assignment9/features/home/domain/entity/author_entity.dart';
import 'package:assignment9/features/home/domain/entity/books_entity.dart';
import 'package:assignment9/features/home/presentation/bloc/home_bloc.dart';
import 'package:assignment9/features/home/presentation/bloc/home_event.dart';
import 'package:assignment9/features/home/presentation/bloc/home_state.dart';
import 'package:assignment9/features/intro_screens/presentation/bloc/intro_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.home),
      centerTitle: false,
      ),
      body: BlocConsumer<HomeBloc,HomeState>(
       
        buildWhen: (previous, current) => current is HomeDataLoadingState || current is HomeInitialState,
        builder: (context, state) {
          switch(state.runtimeType)
          {
            case HomeDataLoadingState:
            return const Center(child: CircularProgressIndicator());

            case HomeInitialState:
          final homeState = state as HomeInitialState;
            return Column(
          
          children: [
           Padding(
             padding: const EdgeInsets.only(top: 21,bottom: 21,left: 13),
             child: Row(
               children: [
                 Text(AppLocalizations.of(context)!.books,style: GoogleFonts.heebo(fontSize:20 , fontWeight:FontWeight.w400),),
               ],
             ),
             
           ),

            Expanded(
              child: ListView.builder(
                itemCount: homeState.booksList.length,
                itemBuilder: (context, index) {
                return Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        BlocProvider.of<HomeBloc>(context).add(BookButtonClickedEvent(index: index));
                      },
                      child: ListTile(title: Text(homeState.booksList[index].bookName.toString()),
                      
                      ),
                    ),
                    const Divider()
                  ],
                );
              },),
            ),

             Padding(
               padding: const EdgeInsets.only(top: 39 , bottom: 17,left: 13),
               child: Row(
                 children: [
                   Text(AppLocalizations.of(context)!.author,style: GoogleFonts.heebo(fontSize:20 , fontWeight:FontWeight.w400),),
                 ],
               ),
             ),
           Expanded(
              child: ListView.builder(
                itemCount: homeState.booksList.length,
                itemBuilder: (context, index) {
                return Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        BlocProvider.of<HomeBloc>(context).add(AuthorButtonClickedEvent(index: index));
                      },
                      child: ListTile(title: Text(homeState.authorList[index].authorName.toString()),
                      
                      ),
                    ),
                    const Divider()
                  ],
                );
              },),
            ),

          ],
        );


        default: return const Center(child: Text('Page Not found'));
          }
        },
         listenWhen: (previous, current) => current is HomeNavigateToAuthorScreenState || current is HomeNavigateToBooksScreenState,
        listener: (context, state) {
          switch(state.runtimeType)
          {
            case HomeNavigateToAuthorScreenState:
            final homeState = state as HomeNavigateToAuthorScreenState;
            final List<AuthorEntity> authList = homeState.authorList;
            int authIndex = homeState.index;
            
            context.push('/home/authordesc',extra: {
                'authList':authList,
                'authIndex':authIndex
            });


            case HomeNavigateToBooksScreenState:
            final homeState = state as HomeNavigateToBooksScreenState;
            final List<BooksEntity> bookList = homeState.bookList;
            int bookIndex = homeState.index;
            context.push('/home/bookdesc',extra: {
              'bookList' : bookList,
              'bookIndex' : bookIndex
            });

          }
        },
       
      ),
    );
  }
}