import 'dart:async';

import 'package:assignment9/features/intro_screens/presentation/bloc/intro_event.dart';
import 'package:assignment9/features/intro_screens/presentation/bloc/intro_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IntroBloc extends Bloc<IntroEvent,IntroState>
{
  IntroBloc():super(IntroInitialState())
  {
on<IntroScreenInitialEvent>(introScreenInitialEvent);
on<NextButtonPressedEvent>(nextButtonPressedEvent);
on<BackButtonPressedEvent>(backButtonPressedEvent);
on<SkipButtonPressedEvent>(skipButtonPressedEvent);
  }
  

  FutureOr<void> introScreenInitialEvent(IntroScreenInitialEvent event, Emitter<IntroState> emit) {
    emit(IntroInitialState());
  }

  FutureOr<void> nextButtonPressedEvent(NextButtonPressedEvent event, Emitter<IntroState> emit) {
    emit(NavigateToNextScreenState());
  }

  FutureOr<void> backButtonPressedEvent(BackButtonPressedEvent event, Emitter<IntroState> emit) {
    emit(NavigateToPreviousScreenState());
  }

  FutureOr<void> skipButtonPressedEvent(SkipButtonPressedEvent event, Emitter<IntroState> emit) {
    emit(SkipIntroScreenState());
  }
}