

import 'package:assignment9/core/widgets/custom_button.dart';
import 'package:assignment9/features/auth/domain/entities/auth_user_entity.dart';
import 'package:assignment9/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:assignment9/features/auth/presentation/bloc/auth_event.dart';
import 'package:assignment9/features/auth/presentation/bloc/auth_state.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          switch (state.runtimeType) {
            case LoginButtonClickedState:
              showDialog(
                context: context,
                builder: (context) => Center(child: CircularProgressIndicator()),
              );
              

            case NavigateToHomeScreenState:
              context.push('/home');
              

            case ErrorState:
              final errorState = state as ErrorState;
              showDialog(
                context: context,
                builder: (context) => AlertDialog(title: Text(errorState.error)),
              );
              

           
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            children: [
              const Expanded(flex: 80, child: SizedBox()),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/images/app_logo.svg'),
                ],
              ),
              const Expanded(flex: 40, child: SizedBox()),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Username',
                    style: GoogleFonts.heebo(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                        labelText: 'Enter Username',
                      ),
                    ),
                  ),
                ],
              ),
              const Expanded(flex: 20, child: SizedBox()),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Password',
                    style: GoogleFonts.heebo(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: TextFormField(
                      controller: passwordController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                        labelText: 'Enter Password',
                      ),
                    ),
                  ),
                ],
              ),
              const Expanded(flex: 44, child: SizedBox()),
              Padding(
                padding: const EdgeInsets.only(left: 130, right: 135),
                child: CustomButton(
                  text: 'Sign In',
                  onpress: () { 
                    final authUserEntity = AuthUserEntity(email: emailController.text, password: passwordController.text);
                    BlocProvider.of<AuthBloc>(context).add(LoginButtonClickedEvent(authUserEntity: authUserEntity));},
                ),
              ),
              const Expanded(flex: 16, child: SizedBox()),
              GestureDetector(
                onTap: () {},
                child: GestureDetector(
                  onTap: () {
                    context.push('/login/signup');
                  },
                  child: Text(
                    'Don’t have an account yet? Sign up',
                    style: GoogleFonts.heebo(fontSize: 16, fontWeight: FontWeight.w400, color: const Color(0xff44546F)),
                  ),
                ),
              ),
              const Expanded(flex: 276, child: SizedBox()),
            ],
          ),
        ),
      ),
    );
  }
}
