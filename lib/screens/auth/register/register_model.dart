import 'package:get/get.dart';

class RegisterModel {
  late String firstName;
  late String lastName;
  late DateTime dob;
  late String email;
  late num phoneNumber;
  late String password;
  late RxString gender=''.obs;
  late List<String> genderList=["male","female","others"];

}