import 'package:hive_flutter/hive_flutter.dart';

class ToDODatabase {
  //list of todo tasks
  List toDoList = [];
  //reference
  final _appbox = Hive.box('appbox');

  //run this method when the app run for the very first time

  void createInitalData() {
    List toDoList = [];
  }

  //load the data
  void loadDatabase() {
    toDoList = _appbox.get("TODO");
  }

  //Update the Database
  void updateDatabase() {
    _appbox.put("TODO",toDoList);
  }
}
