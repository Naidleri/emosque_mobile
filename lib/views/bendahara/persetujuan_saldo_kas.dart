import 'package:flutter/material.dart';
import 'package:emosque_mobile/utils/const.dart';
import 'package:emosque_mobile/widgets/persetujuan_widget.dart';
import '../../widgets/persetujuan_widget.dart'; 

class ApprovePage extends StatefulWidget {
  @override
  _ApprovePageState createState() => _ApprovePageState();
}

class _ApprovePageState extends State<ApprovePage> with SingleTickerProviderStateMixin {
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
            color: Color(0xff06D773),
          ),
        ),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          labelColor: Color(0xff06D773), // Warna teks tab aktif
          indicatorColor: Color(0xff06D773), // Warna indikator aktif
          tabs: [
            Tab(text: 'Belum Disetujui'),
            Tab(text: 'Disetujui'),
            Tab(text: 'Dibatalkan'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Content untuk tab "Belum Disetujui"
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: PersetujuanSaldoKas(

            ),
          ),
          // Content untuk tab "Disetujui"
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: PersetujuanSaldoKas(

            ),
          ),
          // Content untuk tab "Dibatalkan"
          Padding(
            padding: const EdgeInsets.all(20.0),
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