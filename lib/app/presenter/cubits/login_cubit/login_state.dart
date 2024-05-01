// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_cubit.dart';

enum LoginStatus {
  initial,
  completed,
  error,
  loading,
  login,
  cadastrar,
  empty,
  userAlreadyExist,
  incorrectPassword,
}

class LoginState extends Equatable {
  final LoginStatus status;
  final String error;
  final UserModel user;

  const LoginState({
    required this.status,
    required this.error,
    required this.user,
  });

  factory LoginState.initial() {
    return LoginState(
      status: LoginStatus.login,
      error: '',
      user: UserModel(login: '', password: ''),
    );
  }

  LoginState copyWith({
    LoginStatus? status,
    String? error,
    UserModel? user,
  }) {
    return LoginState(
      status: status ?? this.status,
      error: error ?? this.error,
      user: user ?? this.user,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [status, error, user];
}
