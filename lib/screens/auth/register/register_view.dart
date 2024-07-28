import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:todoapp/screens/auth/register/register_controller.dart';
import 'package:todoapp/theme/appcolors.dart';
import 'package:todoapp/widgets/buttons/app_backbutton.dart';
import 'package:todoapp/widgets/buttons/app_button.dart';
import 'package:todoapp/widgets/inputs/icon_input_password_textfield.dart';
import 'package:todoapp/widgets/inputs/icon_input_textfield.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key});

  final RegisterController registerController = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.primary,
      appBar: AppBar(
          backgroundColor: Appcolors.primary,
          title: Text(
            "Register",
            style: TextStyle(color: Appcolors.white),
          ),
          centerTitle: true,
          leading: AppBackbutton()),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(40))),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.90,
          child: ListView(
            padding: EdgeInsets.all(10),
            children: [
              const SizedBox(
                height: 40,
              ),
              IconInputTextfield(
                  iconSymbol: Icons.person,
                  hintText: "first name",
                  inputController: registerController.firstNameController),
              IconInputTextfield(
                  iconSymbol: Icons.person,
                  hintText: "Last name",
                  inputController: registerController.lastNameController),
              Obx((){
                return DropdownButton<String>(
                    value: registerController.registerModel.gender.value,
                    items: registerController.registerModel.genderList.map<DropdownMenuItem<String>>((String value){
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      registerController.registerModel.gender.value = value!.toString();
                    });
              }),
              IconInputTextfield(
                  iconSymbol: Icons.email,
                  hintText: "Email",
                  inputController: registerController.emailController),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Appcolors.black2),
                      borderRadius: BorderRadius.circular(2)),
                  child: InternationalPhoneNumberInput(
                    onInputChanged: (PhoneNumber number) {},
                    textFieldController: registerController.phoneController,
                  ),
                ),
              ),
              IconInputPasswordTextfield(
                  iconSymbol: Icons.lock,
                  inputController: registerController.passwordController,
                  hintText: "Password"),
              AppButton(text: "Register", buttonClick: () {})
            ],
          ),
        ),
      ),
    );
  }
}
