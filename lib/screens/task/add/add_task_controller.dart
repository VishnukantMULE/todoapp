import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/screens/task/add/add_task_model.dart';
import 'package:todoapp/services/db_service/db_service.dart';

class AddTaskController extends GetxController
{
  final AddTaskModel taskModel=AddTaskModel();

  TextEditingController titlecontroller=TextEditingController();
  TextEditingController desctiptionController=TextEditingController();
  TextEditingController subTaskController=TextEditingController();

  selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: taskModel.startDate.value,
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != taskModel.startDate) {

        taskModel.startDate.value = picked;
        taskModel.isStartDateSelected.value=false;

    }
    if(taskModel.endDate.value.isBefore(taskModel.endDate.value))
    {
        taskModel.endDate.value=taskModel.endDate.value;
    }
  }

  selectEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: taskModel.startDate.value,
      firstDate: taskModel.startDate.value,
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != taskModel.endDate.value) {

        taskModel.endDate.value = picked;

    }
  }

  void onoffPriorityTask()
  {
    taskModel.isPriotyTask.value^=true;
    taskModel.isDailyTask.value^=true;
  }
  void onoffDailyTask()
  {
    taskModel.isDailyTask.value^=true;
    taskModel.isPriotyTask.value^=true;
  }


  void createTask()
  {
    taskModel.title=titlecontroller.text;
    taskModel.description=desctiptionController.text;

    if(taskModel.isPriotyTask.value==true)
      {
       DbService().createPriorityTask(taskModel.startDate.value.toString(), taskModel.endDate.value.toString(), taskModel.title, taskModel.description, taskModel.todoList.toString(),taskModel.statusList.toString());
       print("Priority task Added");
      }
    if(taskModel.isDailyTask.value==true)
      {
        DbService().createDailyTask(taskModel.startDate.value.toString(), taskModel.endDate.value.toString(), taskModel.title, taskModel.description,taskModel.status.toString());
        print("Daily Task Added");
      }
  }


  void addSubTask()
  {
    taskModel.todoList.add(subTaskController.text);
    subTaskController.text="";
    taskModel.isPriotyTask.value=false;
    taskModel.isPriotyTask.value=true;

  }


}