import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Homeview extends StatelessWidget {
  const Homeview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text("Home Screen"),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(onPressed: (){}, icon: Icon(Icons.home_sharp,size: 35,color: Colors.blue,)),
            IconButton(onPressed: (){}, icon: Icon(Icons.calendar_month,size: 35,)),
            IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.profile_circled,size: 35,)),

          ],
        ),
      ),
    );
  }
}
