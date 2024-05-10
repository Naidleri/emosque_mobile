import 'package:flutter/material.dart';
import '../../widgets/approve_setuju.dart';
import '../../widgets/approve_batal.dart';
import '../../widgets/dialog_batal.dart';
import '../../widgets/dialog_setuju.dart';
import '../../widgets/approve_belum.dart';
import '../../widgets/dialog_belum.dart';

class ApprovePage extends StatefulWidget {
  @override
  _ApprovePageState createState() => _ApprovePageState();
}

class _ApprovePageState extends State<ApprovePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Persetujuan Kas Masjid',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24.0,
            color: Color(0xff06D773),
          ),
        ),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          labelColor: Color(0xff06D773),
          indicatorColor: Color(0xff06D773),
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
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 1,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return DialogBelum(
                          title: 'Kas Masjid',
                          catatan: '',
                        );
                      },
                    );
                  },
                  child: ApproveBelum(
                    title: 'Kas Masjid ${index + 1}',
                    amount: 'Rp 50.000,00',
                    date: '20 Des 2023',
                  ),
                );
              },
            ),
          ),
          // Content untuk tab "Disetujui"
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 1,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return DialogSetuju(
                          title: 'Kas Masjid',
                          totalSaldo: 'Rp 50.000,00',
                          tanggal: '20 Des 2023',
                        );
                      },
                    );
                  },
                  child: ApproveSetuju(
                    title: 'Kas Masjid ${index + 1}',
                    amount: 'Rp 50.000,00',
                    date: '20 Des 2023',
                  ),
                );
              },
            ),
          ),
          // Content untuk tab "Dibatalkan"
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 1,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return DialogBatal(
                          title: 'Kas Masjid',
                          totalSaldo: 'Rp 50.000,00',
                          tanggal: '20 Des 2023',
                          catatan: 'Tidak sesuai dengan catatan saya',
                        );
                      },
                    );
                  },
                  child: ApproveBatal(
                    title: 'Kas Masjid ${index + 1}',
                    amount: 'Rp 50.000,00',
                    date: '20 Des 2023',
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
