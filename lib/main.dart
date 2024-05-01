import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste_mobile_semeq/app/config/const_color.dart';
import 'package:teste_mobile_semeq/app/presenter/cubits/login_cubit/login_cubit.dart';
import 'package:teste_mobile_semeq/app/presenter/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(
          create: (context) => LoginCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'SEMEQ',
        theme: ThemeData(
          colorScheme:
              ColorScheme.fromSeed(seedColor: ConstColors.primaryColor),
          useMaterial3: true,
        ),
        home: Login(),
      ),
    );
  }
}
