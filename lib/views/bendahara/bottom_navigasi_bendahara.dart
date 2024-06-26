import 'package:emosque_mobile/views/bendahara/homepage_bendahara.dart';
import 'package:emosque_mobile/views/bendahara/profile_bendahara.dart';
import 'package:flutter/material.dart';

class BottomNavigasiBendahara extends StatefulWidget {
  const BottomNavigasiBendahara({super.key});

  @override
  State<BottomNavigasiBendahara> createState() =>
      _BottomNavigasiBendaharaState();
}

class _BottomNavigasiBendaharaState extends State<BottomNavigasiBendahara> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomePageBendahara(),
    ProfileBendahara()
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
              Icons.person,
              size: 28,
            ),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Colors.green[700],
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
