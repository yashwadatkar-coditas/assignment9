import 'package:assignment9/features/home/domain/entity/books_entity.dart';
import 'package:assignment9/features/home/domain/repository/books_repository.dart';

class GetBookUseCase {
  final BookRepository bookRepository;

  GetBookUseCase({required this.bookRepository});
  Future<List<BooksEntity>> getBooksUsecase() async{
    return bookRepository.getBooks();
  }
}