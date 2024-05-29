sealed class AuthState{}
class SignUpScreenInitialState extends AuthState{}
class SubmitButtonClickedSignUpState extends AuthState{}
class UserSuccessfullyAuthenticatedState extends AuthState{}
class ErrorState extends AuthState{
  final String error;

  ErrorState({required this.error});
}
class NavigateToHomeScreenState extends AuthState{}

class LoginButtonClickedState extends AuthState{}