import 'package:emosque_mobile/providers/providers.dart';
import 'package:emosque_mobile/widgets/approve_batal.dart';
import 'package:emosque_mobile/widgets/approve_belum.dart';
import 'package:emosque_mobile/widgets/approve_setuju.dart';
import 'package:emosque_mobile/widgets/dialog_batal.dart';
import 'package:emosque_mobile/widgets/dialog_belum.dart';
import 'package:emosque_mobile/widgets/dialog_setuju.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ReadPersetujuanBendahara extends StatefulWidget {
  const ReadPersetujuanBendahara({super.key});

  @override
  _ReadPersetujuanBendaharaState createState() => _ReadPersetujuanBendaharaState();
}

class _ReadPersetujuanBendaharaState extends State<ReadPersetujuanBendahara>
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
              future:
                  Provider.of<LaporanProvider>(context, listen: false).getAllLaporan(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  var laporanList = Provider.of<LaporanProvider>(context).laporanKas;
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: laporanList.length,
                    itemBuilder: (context, index) {
                      var laporan = laporanList[index];
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
      bottomSheet: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 90,
            color: Colors.white,
          ),
          Positioned(
            top: 10,
            right: 20,
            left: 20,
            bottom: 25,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/createPersetujuanSaldoKasBendahara');
              },
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.green[700]),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              child: Text(
                "Tambahkan Pengeluaran",
                style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
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
