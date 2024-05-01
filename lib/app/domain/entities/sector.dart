import 'package:teste_mobile_semeq/app/domain/entities/set.dart';

class Sector {
  final int idSector;
  final String nameSector;
  final List<Sets> sets;
  Sector({
    required this.idSector,
    required this.nameSector,
    required this.sets,
  });
}
