import 'package:assignment9/features/auth/domain/entities/auth_user_entity.dart';

abstract class AuthRepository{
  Future<void> signUpUser({required AuthUserEntity authUserEntity});
  Future<void> signInUser({required AuthUserEntity authUserEntity});
}