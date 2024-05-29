import 'package:assignment9/features/author/domain/author_entity/author_entity.dart';

sealed class AuthorState {}
class AuthorDataLoadingState extends AuthorState{}
class InitialAuthorScreenState extends AuthorState{
  final List<AuthorScreenEntity> authorList;

  InitialAuthorScreenState({required this.authorList});
}
class AuthorButtonClickedNavigateState extends AuthorState{

    final List<AuthorScreenEntity> authorList;
    final int index;

  AuthorButtonClickedNavigateState({required this.authorList, required this.index});
}