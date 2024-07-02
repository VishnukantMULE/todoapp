import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/screens/auth/login/login_controller.dart';
import 'package:todoapp/screens/auth/register/register_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _useridcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  late final LoginController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    LoginController _controller;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          title: const Center(
            child: Text("To Do APP"),
          ),

        ),
        backgroundColor: Colors.white,

      body: Padding(
        padding: EdgeInsets.all(40),
        child: ListView(
          children: [
            Container(
              height: 70,
            ),

            Image.asset('assets/images/loginbg.png'),
            Container(
              height: 40,
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter User Id",
              ),
              controller: _useridcontroller,
            ),
            Container(
              height: 40,
            ),
            TextField(
              obscureText: true,
              // enableSuggestions: false,
              // autocorrect: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter Your Password",
              ),
              controller: _passwordcontroller,
            ),
            Container(
              height: 30,
            ),
            Row(
              children: [
                Text("Dont have an account ? please"),
                TextButton(onPressed: ()
                    {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterView()));
                    }, child: Text("Regiter"))
              ],
            ),

            Container(
              height: 10,
            ),

            ElevatedButton(
              onPressed: () {
                _controller.updateuserId(_useridcontroller.text);
                _controller.updatePassword(_passwordcontroller.text);
                if(_controller.validateuser())
                  {

                  }
                else
                  {

                  }
              },
              child: Text(
                "Login",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurpleAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                  side: BorderSide(color: Colors.black),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
