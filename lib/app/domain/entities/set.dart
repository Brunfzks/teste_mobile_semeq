import 'package:teste_mobile_semeq/app/domain/entities/equipment.dart';

class Sets {
  final int idSet;
  final String nameSet;
  final List<Equipament> equipaments;

  Sets({
    required this.idSet,
    required this.equipaments,
    required this.nameSet,
  });
}
