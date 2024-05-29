import 'package:assignment9/features/home/domain/entity/books_entity.dart';

class BooksModel extends BooksEntity
{
  final String bookName;
  final String bookDescription;
  BooksModel({required this.bookName, required this.bookDescription}):super(bookName: bookName,bookDescription: bookDescription);
  
}