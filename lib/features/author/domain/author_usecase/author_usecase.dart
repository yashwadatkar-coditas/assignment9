import 'package:assignment9/features/author/domain/author_entity/author_entity.dart';
import 'package:assignment9/features/author/domain/author_repository/author_repository.dart';

class GetAuthorScreenUseCase {
final AuthorScreenRepository authorRepository;

  GetAuthorScreenUseCase({required this.authorRepository});

  Future<List<AuthorScreenEntity>> getAuthorUseCase() async{
    return authorRepository.getAuthor();
  }
}