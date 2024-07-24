import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/screens/task/add/add_task_view.dart';
import 'package:todoapp/theme/appcolors.dart';

class CalenderView extends StatelessWidget {
  const CalenderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Row(
          children: [
            Icon(
              Icons.calendar_month,
              color: Appcolors.primary,
              size: 30,
            ),
            SizedBox(
              width: 10,
            ),
            Text("Feb,2002")
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Appcolors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                )
              ),
                onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AddTaskView()));
                },
                child: const Row(
                  children: [Icon(Icons.add,color: Colors.white,),
                    SizedBox(width: 10,),
                    Text("Add Task",style: TextStyle(color: Colors.white),)],
                )),
          )
        ],
      ),
    );
  }
}
