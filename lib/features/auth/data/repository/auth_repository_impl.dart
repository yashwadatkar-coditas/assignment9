import 'package:assignment9/core/dependency_injection_container/dependency_injection_container.dart';
import 'package:assignment9/features/auth/data/data_source/auth_data_source.dart';
import 'package:assignment9/features/auth/domain/entities/auth_user_entity.dart';
import 'package:assignment9/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository{
  @override
  Future<void> signInUser({required AuthUserEntity authUserEntity}) async{
    
    //throw UnimplementedError();
    await locator<AuthDataSource>().signInUser(email: authUserEntity.email, password: authUserEntity.password);
  }

  @override
  Future<void> signUpUser({required AuthUserEntity authUserEntity}) async{
    
    //throw UnimplementedError();
    await  locator<AuthDataSource>().signUpUser(email: authUserEntity.email, password: authUserEntity.password);
  }
  
  
}