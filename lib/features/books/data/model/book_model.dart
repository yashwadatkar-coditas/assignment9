import 'package:assignment9/features/books/domain/book_entity/book_screen_entity.dart';

class BooksScreenModel extends BooksScreenEntity
{
  final String bookName;
  final String bookDescription;
  BooksScreenModel({required this.bookName, required this.bookDescription}):super(bookName: bookName,bookDescription: bookDescription);
  
}