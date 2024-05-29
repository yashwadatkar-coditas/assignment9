import 'package:assignment9/core/widgets/custom_button.dart';
import 'package:assignment9/features/intro_screens/presentation/bloc/intro_bloc.dart';
import 'package:assignment9/features/intro_screens/presentation/bloc/intro_event.dart';
import 'package:assignment9/features/intro_screens/presentation/bloc/intro_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class IntroScreenOne extends StatelessWidget {
  const IntroScreenOne({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<IntroBloc,IntroState>(
        listener: (context, state) {
          switch(state.runtimeType)
          {
            case NavigateToNextScreenState:
            context.push('/intro_screen_two');

            case SkipIntroScreenState:
            print('navigate');
            context.go('/login');

          }

        },
        child: Column(
          children: [
           const  Expanded(
              flex: 29,
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
        
           const  Expanded(
              flex: 62,
              child: SizedBox()),
            Expanded(
              flex: 642,
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(color:  Color(0xffd9d9d9)),
                child: const Column(
                  children: [
                    Expanded(
                      flex: 287,
                      child: SizedBox(),
                    ),
                    Text('image1'),
                    Expanded(
                      flex: 339,
                      child: SizedBox(),
                    ),
                  ],
                ),
              ),
            ),
             const  Expanded(
              flex: 28,
              child: SizedBox(),
            ),
        
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 135),
              child: CustomButton(text: 'Next', onpress: (){
                BlocProvider.of<IntroBloc>(context).add(NextButtonPressedEvent());
              }),
            ),
        
           const  Expanded(
              flex: 35,
              child: SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
