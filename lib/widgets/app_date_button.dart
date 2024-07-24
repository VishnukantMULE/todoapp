import 'dart:core';
import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/theme/appcolors.dart';

class AppDateButton extends StatelessWidget {
  final bool isCurrentDate;
  final VoidCallback buttonclick;
  final String text;

  const AppDateButton(
      {super.key, required this.isCurrentDate, required this.text,required this.buttonclick});

  @override
  Widget build(BuildContext context) {
    Color buttonBg = Appcolors.white;
    Color iconColor = Appcolors.primary1;
    if (isCurrentDate == true) {
      buttonBg = Appcolors.primary9;
      iconColor = Appcolors.primary5;
    }

    return Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: ElevatedButton(

            style: ElevatedButton.styleFrom(
                backgroundColor: buttonBg,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                fixedSize: Size(MediaQuery.of(context).size.width * 0.40, 55)),
            // onPressed: _selectDate(context),
            onPressed: buttonclick,
            child: Row(
              children: [
                Icon(
                  Icons.calendar_month,
                  color: iconColor,
                ),
                SizedBox(width: 10,),
                Flexible(child: Text(text))
              ],
            )));
  }
}
