import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/utils/date_formatter_util.dart';

class Homeview extends StatelessWidget {
  const Homeview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
         DateFormatterUtil().currentDate(),style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
