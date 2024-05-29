import 'package:assignment9/features/auth/domain/entities/auth_user_entity.dart';

sealed class AuthEvent{}
class SignUpScreenInitialEvent extends AuthEvent{}
class SignUpScreenSignUpButtonCkickedEvent extends AuthEvent{
  final AuthUserEntity authUserEntity;

  SignUpScreenSignUpButtonCkickedEvent({required this.authUserEntity});
}


class LoginButtonClickedEvent extends AuthEvent 
{
  final AuthUserEntity authUserEntity;

  LoginButtonClickedEvent({required this.authUserEntity});
  
}