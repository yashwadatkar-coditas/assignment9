import 'package:assignment9/features/author/domain/author_entity/author_entity.dart';
import 'package:assignment9/features/author/presentation/bloc/author_bloc.dart';
import 'package:assignment9/features/author/presentation/bloc/author_event.dart';
import 'package:assignment9/features/author/presentation/bloc/author_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class AuthorScreen extends StatelessWidget {
  //final List<AuthorEntity> authorList;
  const AuthorScreen({super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(AppLocalizations.of(context)!.author,style: GoogleFonts.heebo(fontSize:20 , fontWeight:FontWeight.w400),),),
      body:BlocConsumer<AuthorBloc,AuthorState>(
        buildWhen: (previous, current) => current is AuthorDataLoadingState || current is InitialAuthorScreenState,
        builder: (context, state) {
        switch(state.runtimeType)
        {
          case AuthorDataLoadingState:
          return const Center(child: CircularProgressIndicator());

          case InitialAuthorScreenState:
          final authorState = state as InitialAuthorScreenState;
          return Column(
       children: [
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: authorState.authorList.length,
            itemBuilder: (context, index) {
            return Column(
              children: [
                GestureDetector(
                  onTap: () {
                    BlocProvider.of<AuthorBloc>(context).add(AuthorButtonClickedEvent(index: index));
                  },
                  child: ListTile(title: Text(authorState.authorList[index].authorName.toString()))),
                const Divider()
              ],
            );
          },),
        )
       ],
        
      );

      default : 
      return const Center(child: Text('Page Not Found'),);
        }
      },
      listenWhen: (previous, current) => current is AuthorButtonClickedNavigateState,
       listener: (context, state) {
        switch(state.runtimeType)
        {
          case AuthorButtonClickedNavigateState:
          final authorState = state as AuthorButtonClickedNavigateState;
           final List <AuthorScreenEntity> authorList = authorState.authorList;
           int index = authorState.index;
            
          context.push('/author/authordesctwo',extra: {
            "authorList":authorList,
            "authorIndex" : index
          });
        }
      },)
      
      
      
       
    );
  }
}