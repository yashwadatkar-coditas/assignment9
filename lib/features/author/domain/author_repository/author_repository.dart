import 'package:assignment9/features/author/domain/author_entity/author_entity.dart';

abstract class AuthorScreenRepository{
  Future<List<AuthorScreenEntity>> getAuthor();
}