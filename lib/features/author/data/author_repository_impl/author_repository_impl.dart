import 'package:assignment9/features/author/data/author_data_source/author_data_source.dart';
import 'package:assignment9/features/author/data/author_model/author_model.dart';
import 'package:assignment9/features/author/domain/author_entity/author_entity.dart';
import 'package:assignment9/features/author/domain/author_repository/author_repository.dart';

class AuthorScreenRepositoryImpl implements AuthorScreenRepository
{
 final  AuthorScreenLocalDataSource authorLocalDataSource;

  AuthorScreenRepositoryImpl({required this.authorLocalDataSource});
  Future<List<AuthorScreenEntity>> getAuthor()async {
     List<AuthorScreenModel> author  = await authorLocalDataSource.getAuthorDataFromLocal();
     return author;
  }
}