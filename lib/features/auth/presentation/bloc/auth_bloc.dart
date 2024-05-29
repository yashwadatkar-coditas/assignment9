import 'dart:async';

import 'package:assignment9/core/dependency_injection_container/dependency_injection_container.dart';

import 'package:assignment9/features/auth/data/repository/auth_repository_impl.dart';
import 'package:assignment9/features/auth/domain/usecase/auth_usecase.dart';
import 'package:assignment9/features/auth/presentation/bloc/auth_event.dart';
import 'package:assignment9/features/auth/presentation/bloc/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent,AuthState>{
  AuthBloc():super(SignUpScreenInitialState())
  {
    on<SignUpScreenInitialEvent>(signUpScreenInitialEvent);
    on<SignUpScreenSignUpButtonCkickedEvent>(signUpScreenSignUpButtonCkickedEvent);
    on<LoginButtonClickedEvent>(loginButtonClickedEvent);
  }

  FutureOr<void> signUpScreenInitialEvent(SignUpScreenInitialEvent event, Emitter<AuthState> emit) {
    emit(SignUpScreenInitialState());
  }

  FutureOr<void> signUpScreenSignUpButtonCkickedEvent(SignUpScreenSignUpButtonCkickedEvent event, Emitter<AuthState> emit)async {
    emit(SubmitButtonClickedSignUpState());
    try{
      await AuthUseCase(authRepository: locator<AuthRepositoryImpl>(), authUserEntity: event.authUserEntity).signUpUserUsecase();
      // emit(UserSuccessfullyAuthenticatedState());
      emit(NavigateToHomeScreenState());
    }
    catch(e)
    {
      emit(ErrorState(error: e.toString()));
    }
  }

  FutureOr<void> loginButtonClickedEvent(LoginButtonClickedEvent event, Emitter<AuthState> emit) async{
    emit(LoginButtonClickedState());
    try
    {
      await AuthUseCase(authRepository: locator<AuthRepositoryImpl>(), authUserEntity: event.authUserEntity).signInUserUsecase();
      emit(NavigateToHomeScreenState());
    }
    catch(e)
    {
        ErrorState(error: e.toString());
    }
  }
}