import 'package:assignment9/features/home/data/local_data_source.dart/local_book_data_source.dart';
import 'package:assignment9/features/home/data/model/books_model.dart';
import 'package:assignment9/features/home/domain/entity/books_entity.dart';
import 'package:assignment9/features/home/domain/repository/books_repository.dart';

class BookRepositoryImpl implements BookRepository
{
  final BooksLocalDataSource bookFromLocal;

  BookRepositoryImpl({required this.bookFromLocal});
  Future<List<BooksEntity>> getBooks() async{
    List<BooksModel> books = await  bookFromLocal.getBooksDataFromLocal();
    return books;
  }
}