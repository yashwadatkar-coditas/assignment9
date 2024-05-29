import 'package:assignment9/features/auth/domain/entities/auth_user_entity.dart';

class AuthUserModel extends AuthUserEntity
{
  final String email;
  final String password;
  AuthUserModel( {required this.email, required this.password}):super(email:email,password: password );
  
}