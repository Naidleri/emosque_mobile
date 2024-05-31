import 'package:emosque_mobile/views/bendahara/persetujuan_saldo_kas.dart';
import 'package:emosque_mobile/views/bendahara/profile_bendahara.dart';
import 'package:emosque_mobile/views/takmir/laporan_page.dart';
import 'package:flutter/material.dart';

class BottomNavigasiTakmir extends StatefulWidget {
  const BottomNavigasiTakmir({super.key});

  @override
  State<BottomNavigasiTakmir> createState() => _BottomNavigasiTakmirState();
}

class _BottomNavigasiTakmirState extends State<BottomNavigasiTakmir> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const LaporanPage(),
    ApprovePage(),
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
            label: 'Profile',
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
