import 'package:dartz/dartz.dart';
import 'package:teste_mobile_semeq/app/domain/entities/area.dart';
import 'package:teste_mobile_semeq/app/domain/errors/errors.dart';
import 'package:teste_mobile_semeq/app/domain/repository/list_repository.dart';
import 'package:teste_mobile_semeq/app/infra/datasource/list_datasource.dart';
import 'package:teste_mobile_semeq/app/usescases/home/get_list_usescase.dart';

class ListRepositoryImpl implements ListRepository {
  final ListDataSource datasource;
  ListRepositoryImpl({
    required this.datasource,
  });

  @override
  Future<Either<GetListExeption, List<Area>>> getList(
      ParamsGetList params) async {
    try {
      final specie = await datasource.login(params);
      return Right(specie);
    } on GetListExeption catch (e) {
      return Left(e);
    } on Exception {
      return left(GetListExeption(message: 'Exception Error'));
    }
  }
}
