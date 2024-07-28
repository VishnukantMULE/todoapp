import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/screens/auth/login/login_controller.dart';
import 'package:todoapp/screens/auth/register/register_view.dart';
import 'package:todoapp/theme/appcolors.dart';
import 'package:todoapp/widgets/buttons/app_button.dart';
import 'package:todoapp/widgets/inputs/icon_input_password_textfield.dart';
import 'package:todoapp/widgets/inputs/icon_input_textfield.dart';

import '../../app.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              const SizedBox(
                height: 120,
              ),
              Image.asset("assets/images/loginbg.png"),
              const SizedBox(
                height: 60,
              ),
              const Center(
                  child: Text(
                "Login to Your Account",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              )),
              const SizedBox(
                height: 30,
              ),
              Column(
                children: [
                  IconInputTextfield(
                    iconSymbol: Icons.email,
                    hintText: 'email',
                    inputController: loginController.emailController,
                  ),
                  IconInputPasswordTextfield(iconSymbol: Icons.lock, inputController: loginController.passwordController, hintText: "password"),

                  Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            "forget password ?",
                            style: TextStyle(color: Appcolors.primary5),
                            textAlign: TextAlign.end,
                          )))
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              AppButton(
                  text: "Login",
                  buttonClick: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const App()));
                  }),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account?",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>  RegisterView()));
                      },
                      child: const Text(
                        "Register",
                        style:
                            TextStyle(color: Appcolors.primary, fontSize: 15),
                      ))
                ],
              )
            ],
          ),
        )
    );
  }
}
