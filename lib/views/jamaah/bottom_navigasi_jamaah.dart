import 'package:emosque_mobile/views/jamaah/homepage_jamaah.dart';
import 'package:emosque_mobile/views/jamaah/kalender_jamaah.dart';
import 'package:emosque_mobile/views/jamaah/profile_jamaah.dart';
import 'package:flutter/material.dart';

class BottomNavigasiJamaah extends StatefulWidget {
  const BottomNavigasiJamaah({super.key});

  @override
  State<BottomNavigasiJamaah> createState() =>
      _BottomNavigasiJamaahState();
}

class _BottomNavigasiJamaahState extends State<BottomNavigasiJamaah> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomepageJamaah(),
    KalenderJamaah(),
    ProfileJamaah()
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
              Icons.home,
              size: 28,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.calendar_month,
              size: 28,
            ),
            label: 'Kalender',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              size: 28,
            ),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
