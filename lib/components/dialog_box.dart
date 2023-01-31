import 'package:flutter/material.dart';
import 'package:to_do/components/button.dart';
import 'package:to_do/style/colors.dart';

class DialogBox extends StatelessWidget {
  VoidCallback OnSave;
  VoidCallback OnCancel;
  final controller;
  DialogBox(
      {super.key,
      required this.OnSave,
      required this.OnCancel,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors().dialogueColor,
      content: Container(
        
        height: 120.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Add New Text',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(width: 9.0,),
                MyButton(
                    text: 'Save',
                    onPressed: () {
                      OnSave();
                    }),
                SizedBox(
                  width: 12.0,
                ),
                MyButton(
                    text: 'Cancel',
                    onPressed: () {
                      OnCancel();
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
