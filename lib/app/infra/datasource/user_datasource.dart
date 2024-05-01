import 'package:teste_mobile_semeq/app/infra/model/user_model.dart';
import 'package:teste_mobile_semeq/app/usescases/login/login_usecase.dart';

abstract class UserDataSource {
  Future<UserModel> login(ParamsUser params);
}
