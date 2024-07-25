import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/theme/appcolors.dart';
import 'package:todoapp/widgets/app_button.dart';
import 'package:todoapp/widgets/app_input_textfield.dart';
import 'package:todoapp/widgets/title_text.dart';

class TodoView extends StatelessWidget {

  final List<String> subTaskList;
  final VoidCallback addsubTask;
  final TextEditingController subtaskController;
  const TodoView({super.key, required this.subTaskList,required this.addsubTask,required this.subtaskController});


  @override
  Widget build(BuildContext context) {


    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        const TitleText(text: "Add subtask"),

        // subtasklist.map<Widget>((e){
        //   return Text(e);
        // }),
        Padding(
          padding: const EdgeInsets.all(20),
          child: ListView.builder(
            shrinkWrap: true,
              // itemCount: subTaskList.length,
              itemCount: subTaskList.length,
              itemBuilder: (context, index){
            return Text("${index+1} : ${subTaskList[index]}",style: const TextStyle(fontSize: 18),);
          }),
        ),



        Row(
          children: <Widget>[
            SizedBox(
              width: MediaQuery.of(context).size.width*0.65,
                child: AppInputTextField(hinttext: 'enter subtask', maxline: 1, inputController: subtaskController,),

            ),


            ElevatedButton(onPressed: addsubTask,

                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(110, 50),
                  backgroundColor: Appcolors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)
                  )
                ),
                
                child:  const Row(
              children: <Widget>[
                Icon(Icons.add,color: Appcolors.white,),
                SizedBox(width: 5,),
                Text("Add",style: TextStyle(color: Appcolors.white),)
              ],
            )

            )
          ],
        ),
        const SizedBox(height: 10,)
      ],
    );
  }
}
