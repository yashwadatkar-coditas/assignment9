import 'package:assignment9/features/books/domain/book_entity/book_screen_entity.dart';

abstract class BookScreenRepository
{
  Future<List<BooksScreenEntity>> getBooks();
}