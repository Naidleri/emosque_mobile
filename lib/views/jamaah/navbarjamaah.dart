import 'package:emosque_mobile/views/jamaah/dashboardjamaah.dart';
import 'package:emosque_mobile/views/jamaah/kalenderjamaah.dart';
import 'package:emosque_mobile/views/jamaah/profile.dart';
import 'package:flutter/material.dart';

class NavbarJamaah extends StatefulWidget {
  const NavbarJamaah({super.key});

  @override
  State<NavbarJamaah> createState() => NavbarJamaahState();
}

class NavbarJamaahState extends State<NavbarJamaah> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    KalenderJamaah(),
    DashboardJamaah(),
    ProfileJamaah(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              color: Color.fromARGB(255, 6, 215, 115),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.calendar_month_outlined,
              color: Color.fromARGB(255, 6, 215, 115),
            ),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Color.fromARGB(255, 6, 215, 115)),
            label: 'Profile',
          ),
        ],
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
