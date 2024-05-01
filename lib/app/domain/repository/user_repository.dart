import 'package:dartz/dartz.dart';
import 'package:teste_mobile_semeq/app/domain/errors/errors.dart';
import 'package:teste_mobile_semeq/app/infra/model/user_model.dart';
import 'package:teste_mobile_semeq/app/usescases/login/login_usecase.dart';

abstract class UserRepository {
  Future<Either<UserException, UserModel>> login(ParamsUser params);
}
