import 'package:assignment9/features/books/domain/book_entity/book_screen_entity.dart';

sealed class BookState {}
class BookLoadingState extends BookState{}
class BookInitialState extends BookState{
  final List<BooksScreenEntity> bookList;

  BookInitialState({required this.bookList});
}
class BookButtonClickedNavigateState extends BookState{

    final List<BooksScreenEntity> bookList;
    final int index;


  BookButtonClickedNavigateState({required this.bookList, required this.index});}