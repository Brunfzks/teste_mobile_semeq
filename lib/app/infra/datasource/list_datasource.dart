import 'package:teste_mobile_semeq/app/domain/entities/area.dart';
import 'package:teste_mobile_semeq/app/usescases/home/get_list_usescase.dart';

abstract class ListDataSource {
  Future<List<Area>> login(ParamsGetList params);
}
