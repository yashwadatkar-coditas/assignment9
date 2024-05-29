sealed class AuthorEvent {}
class InitialAuthorScreenEvent extends AuthorEvent{}
class AuthorButtonClickedEvent extends AuthorEvent{
  final int index;

  AuthorButtonClickedEvent({required this.index});
}