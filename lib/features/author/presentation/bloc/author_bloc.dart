import 'dart:async';

import 'package:assignment9/core/dependency_injection_container/dependency_injection_container.dart';
import 'package:assignment9/features/author/domain/author_entity/author_entity.dart';
import 'package:assignment9/features/author/domain/author_usecase/author_usecase.dart';
import 'package:assignment9/features/author/presentation/bloc/author_event.dart';
import 'package:assignment9/features/author/presentation/bloc/author_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthorBloc extends Bloc<AuthorEvent,AuthorState>{
  AuthorBloc():super(AuthorDataLoadingState())
  {
      on<InitialAuthorScreenEvent>(initialAuthorScreenEvent);
      on<AuthorButtonClickedEvent>(authorButtonClickedEvent);
  }
  

  Future<void> initialAuthorScreenEvent(
      InitialAuthorScreenEvent event, Emitter<AuthorState> emit) async {
    emit(AuthorDataLoadingState());
    await Future.delayed(Duration(seconds: 1));
    final authorList = await locator<GetAuthorScreenUseCase>().getAuthorUseCase();
    emit(InitialAuthorScreenState(authorList: authorList));
  }

  FutureOr<void> authorButtonClickedEvent(AuthorButtonClickedEvent event, Emitter<AuthorState> emit) async {
    final List<AuthorScreenEntity> authorList = await locator<GetAuthorScreenUseCase>().getAuthorUseCase();
    emit(AuthorButtonClickedNavigateState(authorList:authorList , index:event.index ));
  }
}