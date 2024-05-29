import 'package:assignment9/features/auth/domain/entities/auth_user_entity.dart';
import 'package:assignment9/features/auth/domain/repositories/auth_repository.dart';

class AuthUseCase {
  final AuthRepository authRepository;
  final AuthUserEntity authUserEntity;

  AuthUseCase({required this.authRepository, required this.authUserEntity});
  

  Future<void> signUpUserUsecase ()async{
    await authRepository.signUpUser(authUserEntity:authUserEntity );
  }

  Future<void> signInUserUsecase ()async{
    await authRepository.signInUser(authUserEntity:authUserEntity );
  }

}