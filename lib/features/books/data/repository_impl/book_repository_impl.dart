import 'package:assignment9/features/books/data/data_source/book_local_data_source.dart';
import 'package:assignment9/features/books/data/model/book_model.dart';
import 'package:assignment9/features/books/domain/book_entity/book_screen_entity.dart';
import 'package:assignment9/features/books/domain/repository/book_screen_repository.dart';

class BookScreenRepositoryImpl implements BookScreenRepository
{
  final BooksScreenLocalDataSource bookFromLocal;

  BookScreenRepositoryImpl({required this.bookFromLocal});
  Future<List<BooksScreenEntity>> getBooks() async{
    List<BooksScreenModel> books = await  bookFromLocal.getBooksDataFromLocal();
    return books;
  }
}