import 'package:assignment9/features/home/domain/entity/books_entity.dart';

abstract class BookRepository
{
  Future<List<BooksEntity>> getBooks();
}