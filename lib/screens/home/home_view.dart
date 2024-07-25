import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/theme/appcolors.dart';
import 'package:todoapp/utils/date_formatter_util.dart';

class Homeview extends StatelessWidget {
  const Homeview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
         DateFormatterUtil().currentDate(),style: const TextStyle(fontSize: 16),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Icon(CupertinoIcons.bell_solid,color: Appcolors.primary1,size: 30,),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: const [
            Text("Welcome User",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),
            Text("Have a nice day !",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w300),),
            SizedBox(
              height: 30,
            ),
            Text("My Priority Task",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500),),

          ],
        ),
      ),
    );
  }
}
