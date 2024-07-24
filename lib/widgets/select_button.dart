import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/theme/appcolors.dart';

class SelectButton extends StatelessWidget {
  final bool isSelect;
  final String text;
  const SelectButton({super.key, required this.text,required this.isSelect});

  @override
  Widget build(BuildContext context) {
    Color buttonBg=Appcolors.white;
    Color textColor=Appcolors.black;
    if(isSelect==true){
      buttonBg=Appcolors.primary;
      textColor=Appcolors.white;
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: ElevatedButton(onPressed: (){},
          style: ElevatedButton.styleFrom(
              backgroundColor: buttonBg,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
              ),


              fixedSize: Size(MediaQuery.of(context).size.width*0.40, 55)

          ),
          child: Text(text,style: TextStyle(color: textColor,fontSize: 18),)),
    );
  }
}
