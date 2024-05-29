sealed class HomeEvent{}
class HomeInitialEvent extends HomeEvent{}
class BookButtonClickedEvent extends HomeEvent{
  final int index;

  BookButtonClickedEvent({required this.index});
}
class AuthorButtonClickedEvent extends HomeEvent{
  final int index;

  AuthorButtonClickedEvent({required this.index});
}