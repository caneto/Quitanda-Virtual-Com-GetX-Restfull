import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:quitandavirtual/src/config/custom_colors.dart';
import 'package:quitandavirtual/src/pages/auth/controller/auth_controller.dart';
import 'package:quitandavirtual/src/pages/components_widget/custom_text_field.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final cpfformater = MaskTextInputFormatter(
    mask: '###.###.###-##',
    filter: {'#': RegExp(r'[0-9]')},
  );

  final phoneFormater = MaskTextInputFormatter(
    mask: '(##) ####-#####',
    filter: {'#': RegExp(r'[0-9]')},
  );

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final _formKey = GlobalKey<FormState>();
    final authController = Get.find<AuthController>();

    return Scaffold(
      backgroundColor: CustomColors.customSwatchColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              Positioned(
                top: 10.0,
                left: 10.0,
                child: SafeArea(
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.arrow_back_ios, color: Colors.white,),
                  ),
                ),
              ),
              Column(
                children: [
                  const Expanded(
                    child: Center(
                      child: Text(
                        'Cadastro',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 40),
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
                              icon: Icons.mail,
                              label: "Email",
                              textInputType: TextInputType.emailAddress,
                              onSave: (value) {
                                authController.user.email = value;
                              },
                            ),
                            CustomTextField(
                              icon: Icons.lock,
                              label: "Senha",
                              isSecret: true,
                              onSave: (value) {
                                authController.user.password = value;
                              },
                            ),
                            CustomTextField(
                              icon: Icons.person,
                              label: "Nome",
                              onSave: (value) {
                                authController.user.name = value;
                              },
                            ),
                            CustomTextField(
                              icon: Icons.phone,
                              label: "Celular",
                              inputFormatter: [phoneFormater],
                              textInputType: TextInputType.phone,
                              onSave: (value) {
                                authController.user.phone = value;
                              },
                            ),
                            CustomTextField(
                              icon: Icons.file_copy,
                              label: "CPF",
                              inputFormatter: [cpfformater],
                              textInputType: TextInputType.number,
                              onSave: (value) {
                                authController.user.cpf = value;
                              },
                            ),
                            SizedBox(
                              height: 50.0,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18)
                                  )
                                ),
                                onPressed: () {
                                  if(_formKey.currentState!.validate()) {
                                    _formKey.currentState!.save();
                                    //authController.signUp();

                                    print(authController.user); 
                                  }
                                },
                                child: const Text("Cadastrar usuário", style: TextStyle(fontSize: 18),),
                              ),
                            ),
                          ]),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
