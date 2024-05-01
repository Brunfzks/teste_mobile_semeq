import 'package:dartz/dartz.dart';
import 'package:teste_mobile_semeq/app/domain/entities/area.dart';
import 'package:teste_mobile_semeq/app/domain/errors/errors.dart';
import 'package:teste_mobile_semeq/app/usescases/home/get_list_usescase.dart';

abstract class ListRepository {
  Future<Either<GetListExeption, List<Area>>> getList(ParamsGetList params);
}
