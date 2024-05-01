import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/gestures.dart';
import 'package:teste_mobile_semeq/app/domain/entities/area.dart';
import 'package:teste_mobile_semeq/app/domain/entities/set.dart';
import 'package:teste_mobile_semeq/app/domain/errors/errors.dart';
import 'package:teste_mobile_semeq/app/external/data_mock/list_data_mock.dart';
import 'package:teste_mobile_semeq/app/infra/model/user_model.dart';
import 'package:teste_mobile_semeq/app/infra/repositories/list_repository_impl.dart';
import 'package:teste_mobile_semeq/app/usescases/home/get_list_usescase.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState.initial());
  void getUser(UserModel user) {
    emit(
      state.copyWith(user: user),
    );
  }

  void getAreas() async {
    emit(
      state.copyWith(status: HomeStatus.loading),
    );
    final result = await GetList(
            repository: ListRepositoryImpl(datasource: ListDataMock()))
        .call(
      ParamsGetList(),
    );

    result.fold(
        (GetListExeption exception) => {
              emit(state.copyWith(
                status: HomeStatus.error,
              ))
            },
        (List<Area> areas) => {
              emit(state.copyWith(
                status: HomeStatus.completed,
                areas: areas,
              ))
            });
  }

  void alterName(String newName, int indexArea, int indexSet, int indexSector) {
    var auxArea = state.areas;

    var equipAux = auxArea[indexArea].listSector[indexSector].sets[indexSet];

    auxArea[indexArea].listSector[indexSector].sets[indexSet] = Sets(
      idSet: equipAux.idSet,
      equipaments: equipAux.equipaments,
      nameSet: newName,
    );

    emit(state.copyWith(
      status: HomeStatus.completed,
      areas: auxArea,
    ));
  }
}
