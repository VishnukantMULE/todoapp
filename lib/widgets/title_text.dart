import 'package:flutter/cupertino.dart';
import 'package:todoapp/theme/appcolors.dart';

class TitleText extends StatelessWidget {
  final String text;
  const TitleText({super.key,  required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
      child: Text(text, style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w800,
        color: Appcolors.primary1
      ),),
    );
  }
}
