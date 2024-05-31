import 'package:emosque_mobile/views/jamaah/dashboardjamaah.dart';
import 'package:emosque_mobile/views/jamaah/kalenderjamaah.dart';
import 'package:emosque_mobile/views/jamaah/profile.dart';
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
    DashboardJamaah(),
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
            label: '',
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
