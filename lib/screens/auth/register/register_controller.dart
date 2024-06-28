import 'package:todoapp/screens/auth/register/register_model.dart';

class RegisterController{
  RegisterModel model;
  RegisterController(this.model);
  void updateFirstName(String firstname)
  {
    model.firstname=firstname;
  }
  void updateLastName(String lastname)
  {
    model.lastname=lastname;
  }
  void updateEmail(String email)
  {
    model.email=email;
  }
  void updateGender(String gender)
  {
    model.gender=gender;
  }
  void updatePassword(String password)
  {
    model.password=password;
  }
  void updateReeterpassword(String reenterpassword)
  {
   model.reenterpassword=reenterpassword;
  }

}