import 'package:assignment9/core/widgets/custom_button.dart';
import 'package:assignment9/features/intro_screens/presentation/bloc/intro_bloc.dart';
import 'package:assignment9/features/intro_screens/presentation/bloc/intro_event.dart';
import 'package:assignment9/features/intro_screens/presentation/bloc/intro_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class IntroScreenTwo extends StatelessWidget {
  const IntroScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<IntroBloc,IntroState>(
        listener: (context, state) {
          switch(state.runtimeType)
          {
            case NavigateToPreviousScreenState:
            context.pop('intro_screen_one');

            case NavigateToNextScreenState:
            context.push('/intro_screen_three');

            case SkipIntroScreenState:
            context.go('/login');
          }
        },
        child: Column(
          children: [
            const Expanded(
              flex: 39,
              child: SizedBox(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 27),
                  child: CustomButton(
                    text: 'Skip',
                    onpress: () {
                      BlocProvider.of<IntroBloc>(context).add(SkipButtonPressedEvent());
                    },
                  ),
                )
              ],
            ),
            const Expanded(flex: 62, child: SizedBox()),
            Expanded(
              flex: 642,
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(color: Color(0xffd9d9d9)),
                child: const Column(
                  children: [
                    Expanded(
                      flex: 287,
                      child: SizedBox(),
                    ),
                    Text('image2'),
                    Expanded(
                      flex: 339,
                      child: SizedBox(),
                    ),
                  ],
                ),
              ),
            ),
            const Expanded(
              flex: 28,
              child: SizedBox(),
            ),
            Row(
             
              children: [
               const Expanded(
                flex: 47,
                child: SizedBox()),
                CustomButton(
                    text: 'Back',
                    onpress: () {
                      BlocProvider.of<IntroBloc>(context)
                          .add(BackButtonPressedEvent());
                    }),
                const Expanded(
                flex: 51,
                child: SizedBox()),
                CustomButton(
                    text: 'Next',
                    onpress: () {
                      BlocProvider.of<IntroBloc>(context)
                          .add(NextButtonPressedEvent());
                    }),
                    const Expanded(
                flex: 47,
                child: SizedBox()),
              ],
            ),
            const Expanded(
              flex: 45,
              child: SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
