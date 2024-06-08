import 'package:flutter/material.dart';
import 'package:emosque_mobile/utils/const.dart';

class PersetujuanSaldoKas extends StatefulWidget {
  const PersetujuanSaldoKas({super.key});

  @override
  _PersetujuanSaldoKasState createState() => _PersetujuanSaldoKasState();
}

class _PersetujuanSaldoKasState extends State<PersetujuanSaldoKas> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 0); // Mengarahkan ke tab "Belum Disetujui"
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Persetujuan Kas Masjid',
          style: textTextStyle.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 24.0,
            color: Colors.green[700],
          ),
        ),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.green[700], // Warna teks tab aktif
          indicatorColor: Colors.green[700], // Warna indikator aktif
          tabs: const [
            Tab(text: 'Belum Disetujui'),
            Tab(text: 'Disetujui'),
            Tab(text: 'Dibatalkan'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          // Content untuk tab "Belum Disetujui"
          Padding(
            padding: EdgeInsets.all(20.0),
            child: PersetujuanSaldoKas(

            ),
          ),
          // Content untuk tab "Disetujui"
          Padding(
            padding: EdgeInsets.all(20.0),
            child: PersetujuanSaldoKas(

            ),
          ),
          // Content untuk tab "Dibatalkan"
          Padding(
            padding: EdgeInsets.all(20.0),
            child: PersetujuanSaldoKas(
              
            ),
          ),
        ],
      ),
      //bottomNavigationBar: BottomTabBar(),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}