import 'package:assignment9/features/author/domain/author_entity/author_entity.dart';

class AuthorScreenModel extends AuthorScreenEntity {
  AuthorScreenModel({
    required String authorName,
    required String authorDescription,
  }) : super(authorName: authorName, authorDescription: authorDescription);
}