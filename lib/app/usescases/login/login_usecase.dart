// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:teste_mobile_semeq/app/domain/errors/errors.dart';
import 'package:teste_mobile_semeq/app/domain/repository/user_repository.dart';
import 'package:teste_mobile_semeq/app/infra/model/user_model.dart';

abstract class ILogin {
  Future<Either<UserException, UserModel>> call(ParamsUser params);
}

class Login implements ILogin {
  UserRepository repository;
  Login({
    required this.repository,
  });

  @override
  Future<Either<UserException, UserModel>> call(ParamsUser params) async {
    if (params.user.login.isEmpty) {
      return left(UserException(message: 'EMPTY LOGIN'));
    }
    if (params.user.password.isEmpty) {
      return left(UserException(message: 'EMPTY PASSWORD'));
    }
    return await repository.login(params);
  }
}

class ParamsUser {
  final UserModel user;
  ParamsUser({
    required this.user,
  });
}
