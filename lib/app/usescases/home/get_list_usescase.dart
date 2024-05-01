import 'package:dartz/dartz.dart';
import 'package:teste_mobile_semeq/app/domain/entities/area.dart';
import 'package:teste_mobile_semeq/app/domain/errors/errors.dart';
import 'package:teste_mobile_semeq/app/domain/repository/list_repository.dart';

abstract class IGetList {
  Future<Either<GetListExeption, List<Area>>> call(ParamsGetList params);
}

class GetList implements IGetList {
  ListRepository repository;
  GetList({
    required this.repository,
  });

  @override
  Future<Either<GetListExeption, List<Area>>> call(ParamsGetList params) async {
    return await repository.getList(params);
  }
}

class ParamsGetList {}
