import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do/components/dialog_box.dart';
import 'package:to_do/components/todo_tile.dart';
import 'package:to_do/style/colors.dart';
import 'package:to_do/data/database.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //reference the hive box
  final _appbox = Hive.box('appbox');
  ToDODatabase db = ToDODatabase();
  //text controller
  final _controller = TextEditingController();

//checkbox was tapped

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDatabase();
  }

  @override
  void initState() {
    // if the app is opened for first time
    if (_appbox.get("TODO") == null) {
      db.createInitalData();
    } else {
      //app is not started for first time
      db.loadDatabase();
    }
    super.initState();
  }

//save new task
  void saveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
      Navigator.of(context).pop();
      db.updateDatabase();
    });
  }

//create new task

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            OnSave: saveNewTask,
            OnCancel: () => Navigator.of(context).pop(),
          );
        });
  }

  //delete task
  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
      db.updateDatabase();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().backgroundColor,
      appBar: AppBar(
        title: Text('To-Do'),
        centerTitle: true,
        elevation: 0.0,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors().buttonColor,
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: db.toDoList[index][0],
            taskCompleted: db.toDoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
