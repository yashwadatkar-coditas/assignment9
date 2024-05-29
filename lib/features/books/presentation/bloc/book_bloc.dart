import 'dart:async';

import 'package:assignment9/core/dependency_injection_container/dependency_injection_container.dart';
import 'package:assignment9/features/books/domain/book_entity/book_screen_entity.dart';
import 'package:assignment9/features/books/domain/book_usecase/book_use_case.dart';
import 'package:assignment9/features/books/presentation/bloc/book_event.dart';
import 'package:assignment9/features/books/presentation/bloc/book_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookBloc extends Bloc<BookEvent,BookState>{
  BookBloc():super(BookLoadingState())
  {
    on<InitialBookEvent>(initialBookEvent);
    on<BookButtonPressedEvent>(bookButtonPressedEvent);
  }

  Future<void> initialBookEvent(
      InitialBookEvent event, Emitter<BookState> emit) async {
    emit(BookLoadingState());
    await Future.delayed(Duration(seconds: 1));
    final List<BooksScreenEntity> bookList =
        await locator<GetBookScreenUseCase>().getBooksUsecase();
    emit(BookInitialState(bookList: bookList));
  }

  FutureOr<void> bookButtonPressedEvent(BookButtonPressedEvent event, Emitter<BookState> emit) async{
    final List<BooksScreenEntity> bookList =
        await locator<GetBookScreenUseCase>().getBooksUsecase();
    emit(BookButtonClickedNavigateState(bookList: bookList, index: event.index));
  }
}