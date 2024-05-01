import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:teste_mobile_semeq/app/config/const_color.dart';
import 'package:teste_mobile_semeq/app/config/const_text.dart';
import 'package:teste_mobile_semeq/app/presenter/cubits/login_cubit/login_cubit.dart';
import 'package:teste_mobile_semeq/app/presenter/home.dart';
import 'package:teste_mobile_semeq/app/presenter/widget/form_button.dart';
import 'package:teste_mobile_semeq/app/presenter/widget/form_field.dart';

// ignore: must_be_immutable
class Login extends StatelessWidget {
  Login({super.key});

  final _formKey = GlobalKey<FormState>();

  TextEditingController userControler = TextEditingController();
  TextEditingController passwordControler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: width,
          color: ConstColors.primaryColor,
          child: BlocListener<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state.status == LoginStatus.completed) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Home()),
                );
              }
            },
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Container(
                    width: 70,
                    height: 70,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(5),
                        bottomLeft: Radius.circular(5),
                        topLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                      color: ConstColors.secondColor,
                    ),
                    child: const Center(
                      child: Icon(
                        size: 60,
                        Icons.person,
                        color: ConstColors.primaryColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Container(
                      width: width,
                      decoration: const BoxDecoration(
                        color: ConstColors.secondColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(120),
                        ),
                      ),
                      child: BlocBuilder<LoginCubit, LoginState>(
                        builder: (context, state) {
                          if (state.status == LoginStatus.loading) {
                            {
                              return const SizedBox(
                                child: Center(
                                  child: CircularProgressIndicator(
                                    color: ConstColors.primaryColor,
                                  ),
                                ),
                              );
                            }
                          }

                          return Column(
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                              Text(
                                'Welcome',
                                style: ConstText.welcomeText,
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              Form(
                                key: _formKey,
                                child: SizedBox(
                                  width: 300,
                                  child: Column(
                                    children: [
                                      FormFieldWidget(
                                        hintText: 'User',
                                        icon: const Icon(
                                          Icons.person,
                                          color: ConstColors.primaryColor,
                                        ),
                                        controller: userControler,
                                        validator: (text) {
                                          if (text == null || text.isEmpty) {
                                            return 'Por Favor, entre com o Usuario!';
                                          }
                                          return '';
                                        },
                                      ),
                                      const SizedBox(
                                        height: 40,
                                      ),
                                      FormFieldWidget(
                                        isPassword: true,
                                        hintText: 'Password',
                                        icon: const Icon(
                                          Icons.password,
                                          color: ConstColors.primaryColor,
                                        ),
                                        controller: passwordControler,
                                        validator: (text) {
                                          if (text == null || text.isEmpty) {
                                            return 'Por Favor, entre com a Senha!';
                                          }
                                          return '';
                                        },
                                      ),
                                      const SizedBox(
                                        height: 100,
                                      ),
                                      BlocBuilder<LoginCubit, LoginState>(
                                          builder: (context, state) {
                                        if (state.status ==
                                            LoginStatus.incorrectPassword) {
                                          return Text(
                                            'Usuário ou Senha incorreto!',
                                            style: GoogleFonts.roboto(
                                              color: Colors.red.shade300,
                                              wordSpacing: 0.5,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          );
                                        }
                                        return Container();
                                      }),
                                      const SizedBox(
                                        height: 40,
                                      ),
                                      FormsButton(
                                        buttonText: 'Login',
                                        onTap: () {
                                          if (!_formKey.currentState!
                                              .validate()) {
                                            context.read<LoginCubit>().login(
                                                  userControler.text,
                                                  passwordControler.text,
                                                );
                                          }
                                        },
                                        width: 300,
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          );
                        },
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
