import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/screens/auth/login/login_view.dart';
import 'package:todoapp/screens/auth/register/register_controller.dart';

const List<String> genderlist=<String>[
  'Male','Femal','Others'
];

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final TextEditingController _fistname=TextEditingController();
  final TextEditingController _lastname=TextEditingController();
  final TextEditingController _email=TextEditingController();
  final TextEditingController _phonenumber=TextEditingController();
  final TextEditingController _password=TextEditingController();
  final TextEditingController _reenterpassword=TextEditingController();
  late RegisterController _controller;
  String? selectdegender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Register"),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(padding: EdgeInsets.all(40),

      child: ListView(
        children: [
          Image.asset('assets/images/signuppng.png'),
          Container(height: 40,),
          TextField(
            decoration: InputDecoration(
              label: Text('First Name'),
              hintText: 'Enter your first name',
              border: OutlineInputBorder()
            ),
            controller: _fistname,
          ),
          Container(
            height: 40,
          ),
          TextField(
            decoration: InputDecoration(
              label: Text('Last Name'),
              hintText: 'Enter your last name',
              border: OutlineInputBorder()
            ),
            controller: _lastname,
          ),
          Container(
            height: 40,
          ),
          Center(
            child: Container(

              width: MediaQuery.of(context).size.width,

              // margin: EdgeInsets.all(5),
              decoration: BoxDecoration(

                border: Border.all(
                  width: 0.2
                )
              ),

              child: Center(
                child: DropdownButton<String>
                  (items: genderlist.map((String value)
                {
                  return DropdownMenuItem(
                      value:value,
                      child: Text(value)
                  );
                }
                ).toList(),
                  hint: Center(
                    child: Text(
                      selectdegender ?? 'Select Gender',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  onChanged: (String? newvalue)
                  {
                    setState(() {
                      selectdegender=newvalue;
                    });
                  },
                  isExpanded: true,
                  iconSize: 30,
                ),
              ),
            ),
          ),
          Container(
            height: 40,
          ),
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Mobile Number"),
                hintText: 'Enter Mobile Number'
            ),
            controller: _phonenumber,
          ),

          Container(
            height: 40,
          ),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              label: Text("Email"),
              hintText: 'Enter Email address'
            ),
            controller: _email,
          ),
          Container(
            height: 40,
          ),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Password"),
                hintText: 'Enter Password'
            ),
            controller: _password,
          ),
          Container(
            height: 40,
          ),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Re-Enter Password"),
                hintText: 'Enter Password'
            ),
            controller: _reenterpassword,
          ),
          Container(
            height: 40,
          ),
          Row(
            children: [
              Text("Alredy have an account ? please"),
              TextButton(onPressed: ()
              {
                Navigator.pop(context, MaterialPageRoute(builder: (context)=>LoginView()));
              }, child: Text("login"))
            ],
          ),
          ElevatedButton(onPressed: ()
              {}
              , child: Text("Register",style: TextStyle(
                color: Colors.white
              ),),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurpleAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5)
              )
            )
          )


        ],
      ),),
    );
  }
}
