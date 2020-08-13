import 'package:flutter/cupertino.dart';
import 'package:implement_provider/models/task_model.dart';

class AllTask extends ChangeNotifier{
  List<TaskModel> listOfTask = [];

  void addTask(String taskName,String taskDetails){
    TaskModel obj = new TaskModel(taskName,taskDetails);
    listOfTask.add(obj);

    notifyListeners();
  }
}