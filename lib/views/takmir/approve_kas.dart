import 'package:emosque_mobile/widgets/approve_batal.dart';
import 'package:emosque_mobile/widgets/approve_belum.dart';
import 'package:emosque_mobile/widgets/approve_setuju.dart';
import 'package:emosque_mobile/widgets/dialog_batal.dart';
import 'package:emosque_mobile/widgets/dialog_belum.dart';
import 'package:emosque_mobile/widgets/dialog_setuju.dart';
import 'package:flutter/material.dart';


class ApprovePage extends StatefulWidget {
  const ApprovePage({super.key});

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
        title: const Text(
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
          labelColor: const Color(0xff06D773),
          indicatorColor: const Color(0xff06D773),
          tabs: const [
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
                        return const DialogBelum(
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
                        return const DialogSetuju(
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
            padding: const EdgeInsets.all(10.0),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 1,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const DialogBatal(
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
