import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quitandavirtual/src/config/custom_colors.dart';
import 'package:quitandavirtual/src/pages/auth/controller/auth_controller.dart';
import 'package:quitandavirtual/src/pages/auth/view/components/forgot_password_dialog.dart';
import 'package:quitandavirtual/src/pages/components_widget/custom_text_field.dart';
import 'package:quitandavirtual/src/pages_route/app_pages.dart';
import 'package:quitandavirtual/src/services/validators.dart';
import 'package:quitandavirtual/src/utils/utils_services.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  //Controller de campos
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final utilServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: CustomColors.customSwatchColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(children: [
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text.rich(
                  TextSpan(
                      style: const TextStyle(
                        fontSize: 40,
                      ),
                      children: [
                        TextSpan(
                            text: "Quitanda",
                            style: TextStyle(
                              color: CustomColors.customWhiteColor,
                              fontWeight: FontWeight.bold,
                            )),
                        TextSpan(
                            text: "virtual",
                            style: TextStyle(
                              color: CustomColors.customContrastColor,
                            ))
                      ]),
                ),
                SizedBox(
                  height: 30,
                  child: DefaultTextStyle(
                    style: const TextStyle(
                      fontSize: 25,
                    ),
                    child: AnimatedTextKit(
                      pause: Duration.zero,
                      repeatForever: true,
                      animatedTexts: [
                        FadeAnimatedText('Frutas'),
                        FadeAnimatedText('Verduras'),
                        FadeAnimatedText('Legumes'),
                        FadeAnimatedText('Carnes'),
                        FadeAnimatedText('Cereais'),
                        FadeAnimatedText('Laticineos'),
                      ],
                    ),
                  ),
                )
              ],
            )),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(45),
                  )),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CustomTextField(
                      controller: emailController,
                      icon: Icons.email,
                      label: "Email",
                      validator: emailValidator,
                    ),
                    CustomTextField(
                      controller: passwordController,
                      icon: Icons.lock,
                      label: "Senha",
                      isSecret: true,
                      validator: passwordValidator,
                    ),
                    SizedBox(
                      height: 50,
                      child: GetX<AuthController>(
                        builder: (authController) {
                          return ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18),
                                ),
                              ),
                              onPressed: authController.isLoading.value
                                  ? null
                                  : () {
                                      FocusScope.of(context).unfocus();

                                      if (_formKey.currentState!.validate()) {
                                        String email = emailController.text;
                                        String password =
                                            passwordController.text;

                                        authController.signIn(
                                            email: email, password: password);
                                      }
                                    },
                              child: authController.isLoading.value
                                  ? const CircularProgressIndicator()
                                  : const Text(
                                      "Entrar",
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    ));
                        },
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () async {
                          final bool? result = await showDialog(
                              context: context,
                              builder: (_) {
                                return ForgotPasswordDialog(
                                  email: emailController.text,
                                );
                              }
                          );

                          if(result ?? false) {
                            utilServices.showToast(message: 'Um link de recuperação foi enviado para seu email.');
                          }
                        },
                        child: Text(
                          "Esqueceu a Senha?",
                          style: TextStyle(
                            color: CustomColors.customContrastColor,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color: Colors.grey.withAlpha(90),
                              thickness: 2,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.0),
                            child: Text("OU"),
                          ),
                          Expanded(
                            child: Divider(
                              color: Colors.grey.withAlpha(90),
                              thickness: 2,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50.0,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            side: const BorderSide(
                                width: 2, color: Colors.green)),
                        onPressed: () {
                          Get.toNamed(PagesRoutes.signUpRoute);
                        },
                        child: const Text(
                          "Criar conta",
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
