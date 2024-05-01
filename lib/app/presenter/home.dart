import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:teste_mobile_semeq/app/config/const_color.dart';
import 'package:teste_mobile_semeq/app/config/const_text.dart';

import 'package:teste_mobile_semeq/app/domain/entities/equipment.dart';
import 'package:teste_mobile_semeq/app/presenter/cubits/home_cubit/home_cubit.dart';
import 'package:teste_mobile_semeq/app/presenter/widget/form_button.dart';
import 'package:teste_mobile_semeq/app/presenter/widget/form_field.dart';

// ignore: must_be_immutable
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        foregroundColor: ConstColors.secondColor,
        backgroundColor: ConstColors.primaryColor,
      ),
      body: BlocListener<HomeCubit, HomeState>(
        listener: (context, state) async {
          if (state.status == HomeStatus.initial) {
            context.read<HomeCubit>().getAreas();
          }
        },
        child: Container(
          width: width,
          color: ConstColors.primaryColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.14,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        textAlign: TextAlign.left,
                        'Hello',
                        style: ConstText.h2,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        textAlign: TextAlign.left,
                        context
                            .read<HomeCubit>()
                            .state
                            .user
                            .login
                            .toUpperCase(),
                        style: ConstText.h1,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: ConstColors.secondColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: BlocBuilder<HomeCubit, HomeState>(
                      builder: (context, state) {
                    if (state.status == HomeStatus.loading) {
                      return Center(
                        child: Lottie.asset('assets/animation.json'),
                      );
                    }

                    if (state.status == HomeStatus.completed) {
                      return Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          itemCount: state.areas.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: areaCard(
                                index,
                                context,
                              ),
                            );
                          },
                        ),
                      );
                    }
                    return Container();
                  }),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }

  void _configurandoModalBottomSheet(
      int indexArea, int indexSet, int indexSector, context) {
    TextEditingController nameEquipamentController = TextEditingController();

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final _formKey = GlobalKey<FormState>();

    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            decoration: const BoxDecoration(
              color: ConstColors.secondColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            width: width,
            height: height * 0.38,
            child: Column(children: [
              Text(
                'Edit Equipament name',
                style: ConstText.h1Black,
                textAlign: TextAlign.start,
              ),
              Form(
                  key: _formKey,
                  child: BlocBuilder<HomeCubit, HomeState>(
                    builder: (contexts, state) {
                      return Column(
                        children: [
                          SizedBox(
                            width: 330,
                            child: FormFieldWidget(
                              hintText: 'Name',
                              icon: const Icon(
                                Icons.edit,
                                color: ConstColors.primaryColor,
                              ),
                              controller: nameEquipamentController,
                              validator: (text) {
                                if (text == null || text.isEmpty) {
                                  return 'Por Favor, entre com um nome válido!';
                                }
                                return '';
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          FormsButton(
                            invertColors: true,
                            buttonText: 'Confirm',
                            onTap: () {
                              if (!_formKey.currentState!.validate()) {
                                contexts.read<HomeCubit>().alterName(
                                      nameEquipamentController.text,
                                      indexArea,
                                      indexSet,
                                      indexSector,
                                    );
                                Navigator.pop(context);
                                setState(() {});
                              }
                            },
                            width: 300,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          FormsButton(
                            buttonText: 'Cancel',
                            onTap: () {
                              Navigator.pop(context);
                            },
                            width: 300,
                          )
                        ],
                      );
                    },
                  ))
            ]),
          );
        });
  }

  Widget areaCard(int indexArea, BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Icon(Icons.archive_outlined),
            const SizedBox(
              width: 10,
            ),
            Text(
              context.watch<HomeCubit>().state.areas[indexArea].nameArea,
              style: ConstText.textList,
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 20,
          ),
          child: ListView.builder(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemCount: context
                .watch<HomeCubit>()
                .state
                .areas[indexArea]
                .listSector
                .length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: sectorCard(indexArea, index, context),
              );
            },
          ),
        )
      ],
    );
  }

  Widget sectorCard(int indexArea, int indexSector, BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Icon(Icons.archive_outlined),
            const SizedBox(
              width: 10,
            ),
            Text(
              context
                  .watch<HomeCubit>()
                  .state
                  .areas[indexArea]
                  .listSector[indexSector]
                  .nameSector,
              style: ConstText.textList,
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 20,
          ),
          child: ListView.builder(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemCount: context
                .watch<HomeCubit>()
                .state
                .areas[indexArea]
                .listSector[indexSector]
                .sets
                .length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: setsCard(indexArea, index, indexSector, context),
              );
            },
          ),
        )
      ],
    );
  }

  Widget setsCard(
      int indexArea, int indexSet, int indexSector, BuildContext context) {
    return Column(
      children: [
        BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return Row(
              children: [
                const Icon(Icons.archive_outlined),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  state.areas[indexArea].listSector[indexSector].sets[indexSet]
                      .nameSet,
                  style: ConstText.textList,
                ),
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                    onTap: () {
                      _configurandoModalBottomSheet(
                          indexArea, indexSet, indexSector, context);
                    },
                    child: const Icon(
                      Icons.edit,
                      color: ConstColors.primaryColor,
                      size: 19,
                    ))
              ],
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 20,
          ),
          child: ListView.builder(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemCount: context
                .watch<HomeCubit>()
                .state
                .areas[indexArea]
                .listSector[indexSector]
                .sets[indexSet]
                .equipaments
                .length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: equipeCard(context
                    .watch<HomeCubit>()
                    .state
                    .areas[indexArea]
                    .listSector[indexSector]
                    .sets[indexSet]
                    .equipaments[index]),
              );
            },
          ),
        )
      ],
    );
  }

  Widget equipeCard(Equipament equipament) {
    return Column(
      children: [
        Row(
          children: [
            const Icon(Icons.api_rounded),
            const SizedBox(
              width: 10,
            ),
            Text(
              equipament.nameEquipment,
              style: ConstText.textList,
            )
          ],
        )
      ],
    );
  }
}
