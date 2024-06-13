import 'package:emosque_mobile/utils/global.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:emosque_mobile/providers/providers.dart';
import 'package:emosque_mobile/widgets/approve_belum.dart';
import 'package:emosque_mobile/widgets/dialog_belum.dart';

class ReadPersetujuanTakmir extends StatefulWidget {
  const ReadPersetujuanTakmir({super.key});

  @override
  State<ReadPersetujuanTakmir> createState() => _ReadPersetujuanTakmirState();
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
          buildLaporanList(context, false, true),
          buildLaporanList(context, true, false),
          buildLaporanList(context, false, false),
        ],
      ),
    );
  }

  Widget buildLaporanList(
      BuildContext context, bool isApproved, bool isEmptyNote) {
    return Padding(
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
            var laporanList = Provider.of<LaporanProvider>(context).laporanKas;
            var filteredLaporanList = laporanList.where((laporan) {
              if (isApproved) {
                return laporan.persetujuan;
              } else {
                return !laporan.persetujuan &&
                    (isEmptyNote
                        ? laporan.catatan.isEmpty
                        : laporan.catatan.isNotEmpty);
              }
            }).toList();

            return ListView.builder(
              shrinkWrap: true,
              itemCount: filteredLaporanList.length,
              itemBuilder: (context, index) {
                var laporan = filteredLaporanList[index];
                return GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (_) {
                        return DialogBelum(
                          title: laporan.judul,
                          catatan: laporan.catatan ?? '',
                          setuju: (catatan) {
                            Provider.of<LaporanProvider>(context, listen: false)
                                .approveLaporan(laporan.idLaporan, catatan)
                                .then((_) {
                              // takmirNavigationKey.currentState?.setState(() {
                              //   takmirNavigationKey
                              //       .currentState?.selectedIndex = 1;
                              // });
                              Navigator.pushReplacementNamed(
                                  context, '/homepageTakmir');
                            }).catchError((error) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content:
                                      Text('Gagal menyetujui laporan: $error'),
                                ),
                              );
                            });
                          },
                          tidakSetuju: (catatan) {
                            Provider.of<LaporanProvider>(context, listen: false)
                                .rejectLaporan(laporan.idLaporan, catatan)
                                .then((_) {
                              Navigator.pushReplacementNamed(
                                  context, '/homepageTakmir');
                            }).catchError((error) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content:
                                      Text('Gagal menolak laporan: $error'),
                                ),
                              );
                            });
                          },
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
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
