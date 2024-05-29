sealed class BookEvent{}
class InitialBookEvent extends BookEvent{}
class BookButtonPressedEvent extends BookEvent{
  final int index;

  BookButtonPressedEvent({required this.index});
}