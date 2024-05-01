import 'package:teste_mobile_semeq/app/domain/errors/errors.dart';
import 'package:teste_mobile_semeq/app/infra/datasource/user_datasource.dart';
import 'package:teste_mobile_semeq/app/infra/model/user_model.dart';
import 'package:teste_mobile_semeq/app/usescases/login/login_usecase.dart';

class UserDataMock implements UserDataSource {
  final UserModel userDataMock = UserModel(login: 'teste', password: 'teste');
  @override
  Future<UserModel> login(ParamsUser params) async {
    await Future.delayed(const Duration(seconds: 1));
    if (params.user.login == userDataMock.login &&
        params.user.password == userDataMock.password) {
      return params.user;
    }
    throw UserException(message: 'USUARIO INVALIDO');
  }
}
