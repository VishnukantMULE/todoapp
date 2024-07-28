import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:todoapp/screens/auth/login/login_model.dart';

class LoginController extends GetxController{
  final LoginModel loginModel=LoginModel();

  final TextEditingController emailController=TextEditingController();
  final TextEditingController passwordController=TextEditingController();


}