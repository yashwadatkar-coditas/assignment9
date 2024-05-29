import 'package:assignment9/features/home/data/local_data_source.dart/local_author_data_source.dart';
import 'package:assignment9/features/home/data/model/author_model.dart';
import 'package:assignment9/features/home/domain/entity/author_entity.dart';
import 'package:assignment9/features/home/domain/repository/author_repository.dart';

class AuthorRepositoryImpl implements AuthorRepository
{
 final  AuthorLocalDataSource authorLocalDataSource;

  AuthorRepositoryImpl({required this.authorLocalDataSource});
  Future<List<AuthorEntity>> getAuthor()async {
     List<AuthorModel> author  = await authorLocalDataSource.getAuthorDataFromLocal();
     return author;
  }
}