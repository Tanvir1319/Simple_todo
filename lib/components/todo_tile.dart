import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:to_do/style/colors.dart';

class ToDoTile extends StatelessWidget {

  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;
   ToDoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction
    });

  @override


  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 25.0,left: 25.0,top: 25.0,),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              backgroundColor: AppColors().slideColor,
              icon: Icons.delete,
              onPressed: deleteFunction,
              borderRadius: BorderRadius.circular(12.0),
              )
          ],

        ),
        child: Container(
          padding: EdgeInsets.all(24.0),
          child: Row(
            children: [
              //checkbox
              Checkbox(
                value: taskCompleted,
               onChanged: onChanged,
               activeColor:AppColors().checkColor,
               ),
              //task name
              Text(
                taskName,
                style: TextStyle(
                  decoration: taskCompleted? TextDecoration.lineThrough:TextDecoration.none,
                ),
                ),
               
            ],
          ),
      
          decoration: BoxDecoration(
            color: AppColors().commonColor,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}