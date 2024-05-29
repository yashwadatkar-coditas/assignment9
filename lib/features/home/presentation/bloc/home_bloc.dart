import 'dart:async';

import 'package:assignment9/core/dependency_injection_container/dependency_injection_container.dart';
import 'package:assignment9/features/home/domain/usecase/get_author_usecase.dart';
import 'package:assignment9/features/home/domain/usecase/get_books_usecase.dart';
import 'package:assignment9/features/home/presentation/bloc/home_event.dart';
import 'package:assignment9/features/home/presentation/bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeDataLoadingState()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<AuthorButtonClickedEvent>(authorButtonClickedEvent);
    on<BookButtonClickedEvent>(bookButtonClickedEvent);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
      
    emit(HomeDataLoadingState());
    await Future.delayed(Duration(seconds: 2));
   final authorList = await locator<GetAuthorUseCase>().getAuthorUseCase();
   final bookList = await locator<GetBookUseCase>().getBooksUsecase();
    emit(HomeInitialState(authorList: authorList,booksList:bookList ));
  }

  FutureOr<void> authorButtonClickedEvent(AuthorButtonClickedEvent event, Emitter<HomeState> emit) async{
    final authorList = await locator<GetAuthorUseCase>().getAuthorUseCase();
    emit(HomeNavigateToAuthorScreenState(authorList: authorList,index: event.index));
  }

  FutureOr<void> bookButtonClickedEvent(BookButtonClickedEvent event, Emitter<HomeState> emit) async {
     final bookList = await locator<GetBookUseCase>().getBooksUsecase();
    emit(HomeNavigateToBooksScreenState(bookList: bookList, index: event.index));
  }
}
