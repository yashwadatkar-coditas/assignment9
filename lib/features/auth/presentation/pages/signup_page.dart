import 'package:assignment9/core/widgets/custom_button.dart';
import 'package:assignment9/features/auth/domain/entities/auth_user_entity.dart';
import 'package:assignment9/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:assignment9/features/auth/presentation/bloc/auth_event.dart';
import 'package:assignment9/features/auth/presentation/bloc/auth_state.dart';
import 'package:assignment9/features/author/presentation/bloc/author_bloc.dart';


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpPage extends StatelessWidget {
   final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController familyNameController = TextEditingController();
  final TextEditingController givenNameController = TextEditingController();
   SignUpPage({super.key});
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Register',
          style: GoogleFonts.heebo(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        centerTitle: false,
      ),
      body: BlocListener<AuthBloc,AuthState>(
      listener: (context, state) {
        switch(state.runtimeType)
        {
          case SubmitButtonClickedSignUpState:
           showDialog(context: context, builder: (context) {
            return Center(child: CircularProgressIndicator());
          },);

          case NavigateToHomeScreenState:
          context.push('/home');


          case ErrorState:
          final errorState = state as ErrorState;
          showDialog(context: context, builder: (context) {
            return AlertDialog(title: Text(errorState.error));
          },);
        }
      },
       
          
        child:  Padding(
         padding: const EdgeInsets.symmetric(horizontal: 32),
         child: Column(
           children: [
             const Expanded(flex: 194, child: SizedBox()),
             Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text('Given Name',
                     style: GoogleFonts.heebo(
                         fontSize: 14, fontWeight: FontWeight.w500,),),
                 Padding(
                   padding: const EdgeInsets.only(top: 4),
                   child: TextFormField(
                     controller:  givenNameController,
                     decoration: const InputDecoration(
                       border: OutlineInputBorder(
                           borderRadius: BorderRadius.all(Radius.circular(8)),),
                       labelText: 'Enter Given Name',
                     ),
                   ),
                 ),
               ],
             ),
             const Expanded(flex: 20, child: SizedBox()),
             Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text('Family Name',
                     style: GoogleFonts.heebo(
                         fontSize: 14, fontWeight: FontWeight.w500,),),
                 Padding(
                   padding: const EdgeInsets.only(top: 4),
                   child: TextFormField(
                     controller: familyNameController,
                     decoration: const InputDecoration(
                       border: OutlineInputBorder(
                           borderRadius: BorderRadius.all(Radius.circular(8)),),
                       labelText: 'Enter Family Name',
                     ),
                   ),
                 ),
               ],
             ),
             const Expanded(flex: 20, child: SizedBox()),
             Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text('Username',
                     style: GoogleFonts.heebo(
                         fontSize: 14, fontWeight: FontWeight.w500,),),
                 Padding(
                   padding: const EdgeInsets.only(top: 4),
                   child: TextFormField(
                     controller:  emailController,
                     decoration: const InputDecoration(
                       border: OutlineInputBorder(
                           borderRadius: BorderRadius.all(Radius.circular(8)),),
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
                 Text('Password',
                     style: GoogleFonts.heebo(
                         fontSize: 14, fontWeight: FontWeight.w500,),),
                 Padding(
                   padding: const EdgeInsets.only(top: 4),
                   child: TextFormField(
                     controller: passwordController,
                     decoration: const InputDecoration(
                       border: OutlineInputBorder(
                           borderRadius: BorderRadius.all(Radius.circular(8)),),
                       labelText: 'Enter Password',
                     ),
                   ),
                 ),
               ],
             ),
          const Expanded(flex: 23, child: SizedBox()),
      
          Padding(
            padding: const EdgeInsets.only(left: 97 , right: 107),
            child: CustomButton(text: 'Sign up', onpress: () {
              final authUserEntity = AuthUserEntity(email: emailController.text, password: passwordController.text);
              BlocProvider.of<AuthBloc>(context).add(SignUpScreenSignUpButtonCkickedEvent(authUserEntity: authUserEntity));
            },),
          ),
           
             const Expanded(flex: 139, child: SizedBox()),
           ],
         ),
       ) ,

        ),);
    
        }
        
        
      
    
  }

