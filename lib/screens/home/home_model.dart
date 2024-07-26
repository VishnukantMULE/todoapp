import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/appcolors.dart';

class HomeModel
{
  RxBool dtUpdate=true.obs;
  RxBool ptUpdate=false.obs;

  late Color textcolor = Colors.black;
  late Icon statusIcon = Icon(
    Icons.circle_outlined,
    color: Appcolors.primary,
  );


  RxInt dtCount=0.obs;
}