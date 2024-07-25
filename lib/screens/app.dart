import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/screens/calender/calender_view.dart';
import 'package:todoapp/screens/home/home_view.dart';
import 'package:todoapp/screens/user/user_view.dart';
import 'package:todoapp/theme/appcolors.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int _currentIndex=1;
  final List<Widget> _screens=[
     const Homeview(),
     const CalenderView(),
     const UserView()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
          onTap: (index)
          {
            setState(() {
              _currentIndex=index;
            });
          },
          // selectedItemColor: Appcolors.primary,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          unselectedIconTheme: IconThemeData(
            color: Appcolors.primary5
          ),
          selectedIconTheme: IconThemeData(
            color: Appcolors.primary,
            size: 40
          ),
          iconSize: 35,
          items:  const [
        BottomNavigationBarItem(icon: Icon(Icons.home_rounded),label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.calendar_month),label: 'calender'),
        BottomNavigationBarItem(icon: Icon(CupertinoIcons.person_solid),label: 'user')
      ]
      ),



    );
  }
}
