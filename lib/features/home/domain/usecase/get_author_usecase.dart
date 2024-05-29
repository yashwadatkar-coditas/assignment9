import 'package:assignment9/features/home/domain/entity/author_entity.dart';
import 'package:assignment9/features/home/domain/repository/author_repository.dart';

 class GetAuthorUseCase {
final AuthorRepository authorRepository;

  GetAuthorUseCase({required this.authorRepository});

  Future<List<AuthorEntity>> getAuthorUseCase() async{
    return authorRepository.getAuthor();
  }
}