// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_cubit.dart';

enum HomeStatus { initial, completed, error, loading }

class HomeState extends Equatable {
  final HomeStatus status;
  final String error;
  final UserModel user;
  final List<Area> areas;
  const HomeState({
    required this.status,
    required this.error,
    required this.user,
    required this.areas,
  });

  factory HomeState.initial() {
    return HomeState(
      status: HomeStatus.initial,
      error: '',
      user: UserModel(login: '', password: ''),
      areas: const [],
    );
  }

  HomeState copyWith({
    HomeStatus? status,
    String? error,
    UserModel? user,
    List<Area>? areas,
  }) {
    return HomeState(
      status: status ?? this.status,
      error: error ?? this.error,
      user: user ?? this.user,
      areas: areas ?? this.areas,
    );
  }

  @override
  List<Object> get props => [status, error, user, areas];

  @override
  bool get stringify => true;
}
