import 'package:diu_student/core/resources/data_state.dart';
import 'package:diu_student/core/util/Entities/user_info.dart';

abstract class AuthRepository {
  Future<DataState<UserEntity>> signUpUser({
    required UserEntity user,
    required String confirmPassword,
  });

  Future<DataState<UserEntity>> loginUser({
    required String email,
    required String password,
  });

  Future<DataState<String>> forgotPassword({
    required String email,
  });

  Future<DataState<String>> verifyUser({
    required UserEntity user,
  });
}
