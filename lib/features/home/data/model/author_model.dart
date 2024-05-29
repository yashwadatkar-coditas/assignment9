import 'package:assignment9/features/home/domain/entity/author_entity.dart';

class AuthorModel extends AuthorEntity {
  AuthorModel({
    required String authorName,
    required String authorDescription,
  }) : super(authorName: authorName, authorDescription: authorDescription);
}