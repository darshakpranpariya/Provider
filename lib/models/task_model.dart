class TaskModel{
  String _taskName;
  String _taskDetails;

  String get taskName => _taskName;
  String get taskDetails  => _taskDetails;

  TaskModel(String tn,String td){
    _taskName = tn;
    _taskDetails = td;
  }
}