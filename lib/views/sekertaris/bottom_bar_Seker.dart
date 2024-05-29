import 'package:emosque_mobile/views/sekertaris/homepage_sekertaris.dart';
import 'package:emosque_mobile/views/sekertaris/profile_sekertaris.dart';
import 'package:flutter/material.dart';

class MyBottomBarSeker extends StatefulWidget {
  const MyBottomBarSeker({super.key});

  @override
  State<MyBottomBarSeker> createState() => _MyBottomBarSekerState();
}

class _MyBottomBarSekerState extends State<MyBottomBarSeker> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    MyHomepageSekertaris(),
    ProfileSekertaris()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
            color: Color(0xff06d773),
          ),
          child: BottomNavigationBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            unselectedItemColor: Colors.white.withOpacity(0.5),
            selectedItemColor: Colors.white,
            selectedLabelStyle: const TextStyle(fontSize: 18),
            unselectedLabelStyle: const TextStyle(fontSize: 18),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_outlined,
                  size: 40,
                ),
                label: 'Beranda',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  size: 40,
                ),
                label: 'Profile',
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}
