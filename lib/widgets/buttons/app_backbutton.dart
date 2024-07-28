import 'package:flutter/material.dart';

import '../../theme/appcolors.dart';

class AppBackbutton extends StatelessWidget {
  const AppBackbutton({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(10.0),
      child: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          color: Appcolors.primary,
          style: IconButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
          icon: const Icon(Icons.arrow_back_outlined)),
    );
  }
}
