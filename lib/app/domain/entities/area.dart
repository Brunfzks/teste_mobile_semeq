import 'package:teste_mobile_semeq/app/domain/entities/sector.dart';

class Area {
  final int idArea;
  final String nameArea;
  final List<Sector> listSector;
  Area({
    required this.idArea,
    required this.nameArea,
    required this.listSector,
  });
}
