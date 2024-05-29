import 'package:assignment9/features/books/domain/book_entity/book_screen_entity.dart';
import 'package:assignment9/features/books/domain/repository/book_screen_repository.dart';

class GetBookScreenUseCase {
  final BookScreenRepository bookRepository;

  GetBookScreenUseCase({required this.bookRepository});
  Future<List<BooksScreenEntity>> getBooksUsecase() async{
    return bookRepository.getBooks();
  }
}