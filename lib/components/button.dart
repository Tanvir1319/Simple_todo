import 'package:flutter/material.dart';
import 'package:to_do/style/colors.dart';

class MyButton extends StatelessWidget {


   final text;
  VoidCallback onPressed;

   MyButton({
    super.key,
    required this.text,
    required this.onPressed,
    });

 

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: AppColors().buttonColor,
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
