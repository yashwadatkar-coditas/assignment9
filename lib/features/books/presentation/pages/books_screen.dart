import 'package:assignment9/features/books/domain/book_entity/book_screen_entity.dart';
import 'package:assignment9/features/books/presentation/bloc/book_bloc.dart';
import 'package:assignment9/features/books/presentation/bloc/book_event.dart';
import 'package:assignment9/features/books/presentation/bloc/book_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BooksScreen extends StatelessWidget {
  
  const BooksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      
        appBar: AppBar(
          centerTitle: false,
          title: Text(AppLocalizations.of(context)!.books)),
      body: BlocConsumer<BookBloc,BookState>(
        buildWhen: (previous, current) => current is BookLoadingState || current is BookInitialState,
        builder: (context, state) {
        switch(state.runtimeType)
        {
          case BookLoadingState:
          return const Center(child: CircularProgressIndicator());

          case BookInitialState:
          final bookState  = state as BookInitialState;
          return 
      Column(
       
        children: [
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: bookState.bookList.length,
              itemBuilder: (context, index) {
              return Column(
                children: [
            GestureDetector(
              onTap: () {
                 BlocProvider.of<BookBloc>(context).add(BookButtonPressedEvent(index: index));
              },
              
             
              child: ListTile(title: Text(bookState.bookList[index].bookName.toString()))),
            const Divider()
                ],
              );
            },),
          )
        ],
      );

      default : return const Center(child: Text('Page not found '));
        }
      }, 
      listenWhen: (previous, current) => current is BookButtonClickedNavigateState,
      listener: (context, state) {
        switch(state.runtimeType)
        {
          case BookButtonClickedNavigateState:
          final bookState = state as BookButtonClickedNavigateState;
          final List<BooksScreenEntity> bookList = bookState.bookList;
          int index = bookState.index;
          context.push('/books/bookdesc',extra: {
              "bookList":bookList,
              "bookIndex":index
          });
        }
      },)
      
      
    );
  }
}