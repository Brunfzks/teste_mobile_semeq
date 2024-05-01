import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:teste_mobile_semeq/app/domain/errors/errors.dart';
import 'package:teste_mobile_semeq/app/external/data_mock/login_data_mock.dart';
import 'package:teste_mobile_semeq/app/infra/model/user_model.dart';
import 'package:teste_mobile_semeq/app/infra/repositories/user_repositories_impl.dart';
import 'package:teste_mobile_semeq/app/usescases/login/login_usecase.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState.initial());

  void changeStatus() {
    emit(
      state.copyWith(
          status: state.status == LoginStatus.login ||
                  state.status == LoginStatus.userAlreadyExist ||
                  state.status == LoginStatus.incorrectPassword
              ? LoginStatus.cadastrar
              : LoginStatus.login),
    );
  }

  void login(String login, password) async {
    emit(
      state.copyWith(status: LoginStatus.loading),
    );
    final result =
        await Login(repository: UserRepositoryImpl(datasource: UserDataMock()))
            .call(
      ParamsUser(
        user: UserModel(login: login, password: password),
      ),
    );

    result.fold(
        (UserException exception) => {
              if (exception.message == 'USUARIO INVALIDO')
                {
                  emit(state.copyWith(
                    status: LoginStatus.incorrectPassword,
                  ))
                }
              else
                {
                  emit(state.copyWith(
                    status: LoginStatus.error,
                    error: exception.message,
                  ))
                }
            },
        (UserModel user) => {
              emit(state.copyWith(
                status: LoginStatus.completed,
                user: user,
              ))
            });
  }
}
