import 'package:dartz/dartz.dart';
import 'package:teste_mobile_semeq/app/domain/errors/errors.dart';
import 'package:teste_mobile_semeq/app/domain/repository/user_repository.dart';
import 'package:teste_mobile_semeq/app/infra/datasource/user_datasource.dart';
import 'package:teste_mobile_semeq/app/infra/model/user_model.dart';
import 'package:teste_mobile_semeq/app/usescases/login/login_usecase.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource datasource;
  UserRepositoryImpl({
    required this.datasource,
  });

  @override
  Future<Either<UserException, UserModel>> login(ParamsUser params) async {
    try {
      final specie = await datasource.login(params);
      return Right(specie);
    } on UserException catch (e) {
      return Left(e);
    } on Exception {
      return left(UserException(message: 'Exception Error'));
    }
  }
}
