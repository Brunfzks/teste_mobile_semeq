import 'package:teste_mobile_semeq/app/domain/entities/area.dart';
import 'package:teste_mobile_semeq/app/domain/entities/equipment.dart';
import 'package:teste_mobile_semeq/app/domain/entities/sector.dart';
import 'package:teste_mobile_semeq/app/domain/entities/set.dart';
import 'package:teste_mobile_semeq/app/infra/datasource/list_datasource.dart';
import 'package:teste_mobile_semeq/app/usescases/home/get_list_usescase.dart';

class ListDataMock implements ListDataSource {
  final List<Area> areaDataMock = [
    Area(idArea: 1, nameArea: 'Area 1', listSector: [
      Sector(idSector: 1, nameSector: 'Sector 1', sets: [
        Sets(
            idSet: 1,
            equipaments: [
              Equipament(
                idEquipment: 1,
                nameEquipment: 'Sensor 1',
              ),
              Equipament(
                idEquipment: 2,
                nameEquipment: 'Sensor 2',
              ),
            ],
            nameSet: 'Motor 1')
      ]),
      Sector(idSector: 2, nameSector: 'Sector 2', sets: [
        Sets(
          idSet: 2,
          equipaments: [
            Equipament(
              idEquipment: 3,
              nameEquipment: 'Sensor 1',
            ),
            Equipament(
              idEquipment: 4,
              nameEquipment: 'Sensor 2',
            ),
          ],
          nameSet: 'Motor 1',
        ),
        Sets(
          idSet: 3,
          equipaments: [
            Equipament(
              idEquipment: 5,
              nameEquipment: 'Sensor 1',
            ),
            Equipament(
              idEquipment: 6,
              nameEquipment: 'Sensor 2',
            ),
          ],
          nameSet: 'Motor 2',
        )
      ]),
    ]),
    Area(idArea: 1, nameArea: 'Area 1', listSector: [
      Sector(idSector: 1, nameSector: 'Sector 1', sets: [
        Sets(
            idSet: 1,
            equipaments: [
              Equipament(
                idEquipment: 1,
                nameEquipment: 'Sensor 1',
              ),
              Equipament(
                idEquipment: 2,
                nameEquipment: 'Sensor 2',
              ),
            ],
            nameSet: 'Motor 1')
      ]),
      Sector(idSector: 2, nameSector: 'Sector 2', sets: [
        Sets(
          idSet: 2,
          equipaments: [
            Equipament(
              idEquipment: 3,
              nameEquipment: 'Sensor 1',
            ),
            Equipament(
              idEquipment: 4,
              nameEquipment: 'Sensor 2',
            ),
          ],
          nameSet: 'Motor 1',
        ),
        Sets(
          idSet: 3,
          equipaments: [
            Equipament(
              idEquipment: 5,
              nameEquipment: 'Sensor 1',
            ),
            Equipament(
              idEquipment: 6,
              nameEquipment: 'Sensor 2',
            ),
          ],
          nameSet: 'Motor 2',
        )
      ]),
    ]),
  ];

  @override
  Future<List<Area>> login(ParamsGetList params) async {
    await Future.delayed(const Duration(seconds: 1));
    return areaDataMock;
  }
}
