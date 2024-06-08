import 'package:emosque_mobile/views/bendahara/profile_bendahara.dart';
import 'package:emosque_mobile/views/takmir/read_persetujuan_takmir.dart';
import 'package:emosque_mobile/views/takmir/homepage_takmir.dart';
import 'package:flutter/material.dart';

class BottomNavigasiTakmir extends StatefulWidget {
  const BottomNavigasiTakmir({super.key});

  @override
  State<BottomNavigasiTakmir> createState() => _BottomNavigasiTakmirState();
}

class _BottomNavigasiTakmirState extends State<BottomNavigasiTakmir> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const HomepageTakmir(),
    const ReadPersetujuanTakmir(),
    const ProfileBendahara()
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
              Icons.insert_chart,
              size: 28,
            ),
            label: 'Persetujuan',
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
