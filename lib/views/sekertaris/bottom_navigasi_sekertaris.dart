import 'package:emosque_mobile/views/sekertaris/homepage_sekertaris.dart';
import 'package:emosque_mobile/views/sekertaris/profile_sekertaris.dart';
import 'package:flutter/material.dart';

class BottomNavigasiSekertaris extends StatefulWidget {
  const BottomNavigasiSekertaris({super.key});

  @override
  State<BottomNavigasiSekertaris> createState() =>
      _BottomNavigasiSekertarisState();
}

class _BottomNavigasiSekertarisState extends State<BottomNavigasiSekertaris> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomepageSekertaris(),
    ProfileSekertaris()
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
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
