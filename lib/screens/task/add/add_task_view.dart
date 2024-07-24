import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/theme/appcolors.dart';
import 'package:todoapp/widgets/app_button.dart';
import 'package:todoapp/widgets/app_date_button.dart';
import 'package:todoapp/widgets/app_input_textfield.dart';
import 'package:todoapp/widgets/select_button.dart';
import 'package:todoapp/widgets/title_text.dart';

class AddTaskView extends StatefulWidget {
  const AddTaskView({super.key});

  @override
  State<AddTaskView> createState() => _AddTaskViewState();
}

class _AddTaskViewState extends State<AddTaskView> {
  DateTime selectedDate=DateTime.now();

  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime(2024),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.primary,
      appBar: AppBar(
        backgroundColor: Appcolors.primary,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            color: Appcolors.primary,
            style: IconButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            icon: const Icon(Icons.arrow_back_outlined)),
        title: const Center(
            child: Text(
          "Add Task",
          style: TextStyle(color: Colors.white, fontSize: 18),
        )),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 80, 0, 0),
        child: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(40))),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children:  [
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        TitleText(text: 'Start'),
                        AppDateButton(isCurrentDate: true, text: selectedDate.toString(), buttonclick: () { _selectDate(context); },)
                      ],
                    ),
                    Column(
                      children: [
                        TitleText(text: 'End'),
                        AppDateButton(isCurrentDate: false, text: 'Feb-21-2024', buttonclick: () { _selectDate(context); },)
                      ],
                    )

                  ],
                ),
                SizedBox(
                  height: 40,
                ),

                TitleText(
                  text: "Title",
                ),
                AppInputTextField(
                  hinttext: "Enter Task title",
                  maxline: 1,
                ),
                SizedBox(
                  height: 40,
                ),
                TitleText(text: "Category"),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SelectButton(text: 'Priority Task', isSelect: false),
                    SelectButton(text: 'Daily Task', isSelect: true)
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                TitleText(text: "Description"),
                AppInputTextField(
                  hinttext: "Enter Task Description ...",
                  maxline: 5,
                ),
                SizedBox(
                  height: 40,
                ),
                AppButton(text: "Create Task")
              ],
            ),
          ),
          // color:Colors.white,
        ),
      ),
    );
  }
}
