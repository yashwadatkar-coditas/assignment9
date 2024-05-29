import 'package:assignment9/features/home/domain/entity/author_entity.dart';

abstract class AuthorRepository{
  Future<List<AuthorEntity>> getAuthor();
}