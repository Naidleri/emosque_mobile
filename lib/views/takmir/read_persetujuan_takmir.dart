import 'package:emosque_mobile/providers/providers.dart';
import 'package:emosque_mobile/widgets/approve_batal.dart';
import 'package:emosque_mobile/widgets/approve_belum.dart';
import 'package:emosque_mobile/widgets/approve_setuju.dart';
import 'package:emosque_mobile/widgets/dialog_batal.dart';
import 'package:emosque_mobile/widgets/dialog_belum.dart';
import 'package:emosque_mobile/widgets/dialog_setuju.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReadPersetujuanTakmir extends StatefulWidget {
  const ReadPersetujuanTakmir({super.key});

  @override
  _ReadPersetujuanTakmirState createState() => _ReadPersetujuanTakmirState();
}

class _ReadPersetujuanTakmirState extends State<ReadPersetujuanTakmir>
    with SingleTickerProviderStateMixin {
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
            color: Colors.green[700],
          ),
        ),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.green[700],
          indicatorColor: Colors.green[700],
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
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: FutureBuilder<void>(
              future: Provider.of<LaporanProvider>(context, listen: false)
                  .getAllLaporan(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  var laporanList =
                      Provider.of<LaporanProvider>(context).laporanKas;
                  // Filter laporanList based on persetujuan and catatan conditions
                  var filteredLaporanList = laporanList
                      .where((laporan) =>
                          !laporan.persetujuan && laporan.catatan.isEmpty)
                      .toList();

                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: filteredLaporanList.length,
                    itemBuilder: (context, index) {
                      var laporan = filteredLaporanList[index];
                      return GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return DialogBelum(
                                title: laporan.judul,
                                catatan: '',
                              );
                            },
                          );
                        },
                        child: ApproveBelum(
                          judul: laporan.judul,
                          nominal: laporan.totalSaldo,
                          date: laporan.tanggal,
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: FutureBuilder<void>(
              future: Provider.of<LaporanProvider>(context, listen: false)
                  .getAllLaporan(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  var laporanList =
                      Provider.of<LaporanProvider>(context).laporanKas;
                  // Filter laporanList based on persetujuan and catatan conditions
                  var filteredLaporanList = laporanList
                      .where((laporan) => laporan.persetujuan)
                      .toList();

                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: filteredLaporanList.length,
                    itemBuilder: (context, index) {
                      var laporan = filteredLaporanList[index];
                      return GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return DialogBelum(
                                title: laporan.judul,
                                catatan: '',
                              );
                            },
                          );
                        },
                        child: ApproveBelum(
                          judul: laporan.judul,
                          nominal: laporan.totalSaldo,
                          date: laporan.tanggal,
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
          // Content untuk tab "Dibatalkan"
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: FutureBuilder<void>(
              future: Provider.of<LaporanProvider>(context, listen: false)
                  .getAllLaporan(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  var laporanList =
                      Provider.of<LaporanProvider>(context).laporanKas;
                  // Filter laporanList based on persetujuan and catatan conditions
                  var filteredLaporanList = laporanList
                      .where((laporan) =>
                          !laporan.persetujuan && !laporan.catatan.isEmpty)
                      .toList();

                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: filteredLaporanList.length,
                    itemBuilder: (context, index) {
                      var laporan = filteredLaporanList[index];
                      return GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return DialogBelum(
                                title: laporan.judul,
                                catatan: '',
                              );
                            },
                          );
                        },
                        child: ApproveBelum(
                          judul: laporan.judul,
                          nominal: laporan.totalSaldo,
                          date: laporan.tanggal,
                        ),
                      );
                    },
                  );
                }
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
