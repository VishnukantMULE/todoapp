
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/screens/task/add/add_task_controller.dart';
import 'package:todoapp/screens/task/todo/todo_view.dart';
import 'package:todoapp/theme/appcolors.dart';
import 'package:todoapp/utils/date_formatter_util.dart';
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
  final AddTaskController controller =Get.put(AddTaskController());

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
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        const TitleText(text: 'Start'),
                        Obx((){
                          return  AppDateButton(isCurrentDate: controller.taskModel.isStartDateSelected.value, text: DateFormatterUtil().DateFormateyMMMd(controller.taskModel.startDate.value), buttonclick: () {controller.selectStartDate(context); },);
                        })
                      ],
                    ),
                    Column(
                      children: [
                        const TitleText(text: 'End'),
                        AppDateButton(isCurrentDate: false, text: DateFormatterUtil().DateFormateyMMMd(controller.taskModel.endDate.value), buttonclick: () { controller.selectEndDate(context); },)
                      ],
                    )

                  ],
                ),
                const SizedBox(
                  height: 40,
                ),

                const TitleText(
                  text: "Title",
                ),
                 AppInputTextField(
                  hinttext: "Enter Task title",
                  maxline: 1, inputController: controller.titlecontroller,
                ),
                const SizedBox(
                  height: 40,
                ),
                const TitleText(text: "Category"),
                const SizedBox(
                  height: 10,
                ),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx((){
                      return SelectButton(text: 'Priority Task', isSelect: controller.taskModel.isPriotyTask.value, buttonClick: controller.onoffPriorityTask,);
                    })
                    ,
                    Obx((){
                      return SelectButton(text: 'Daily Task', isSelect: controller.taskModel.isDailyTask.value, buttonClick: controller.onoffDailyTask,);
                    })
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                const TitleText(text: "Description"),
                 AppInputTextField(
                  hinttext: "Enter Task Description ...",
                  maxline: 5, inputController: controller.desctiptionController,
                ),
                const SizedBox(
                  height: 40,
                ),
                Obx((){
                  List<String> todolist=controller.taskModel.todoList.toList();
                  return  controller.taskModel.isPriotyTask.value? TodoView(subTaskList: controller.taskModel.todoList, addsubTask: controller.addSubTask, subtaskController: controller.subTaskController,):const SizedBox();
                }),

                 AppButton(text: "Create Task", buttonClick: controller.createTask,)
              ],
            ),
          ),
          // color:Colors.white,
        ),
      ),
    );
  }
}
