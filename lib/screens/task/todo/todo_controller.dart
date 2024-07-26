import 'package:get/get.dart';
import 'package:todoapp/screens/task/add/add_task_controller.dart';
import 'package:todoapp/screens/task/add/add_task_model.dart';
import 'package:todoapp/screens/task/todo/todo_model.dart';

class TodoController extends GetxController
{
  final model=Get.find<AddTaskController>().taskModel;

  void deleteSubTask(int index)
  {
    model.todoList.removeAt(index);
    // print("list in String ${model.todoList.toString()}");
    model.isPriotyTask.value=false;
    model.isPriotyTask.value=true;
  }


  void editSubTask(int index)
  {
    
  }

}