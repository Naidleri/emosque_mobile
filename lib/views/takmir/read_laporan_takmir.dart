import 'package:emosque_mobile/providers/providers.dart';
import 'package:emosque_mobile/widgets/laporan_card.dart';
import 'package:emosque_mobile/widgets/detail_laporan_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReadLaporanTakmir extends StatefulWidget {
  const ReadLaporanTakmir({super.key});

  @override
  State<ReadLaporanTakmir> createState() => _ReadLaporanTakmirState();
}

class _ReadLaporanTakmirState extends State<ReadLaporanTakmir> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => Provider.of<LaporanProvider>(context, listen: false).getAllLaporan());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Semua Laporan',
            style: TextStyle(
                color: Colors.green[700],
                fontSize: 24.0,
                fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Consumer<LaporanProvider>(
        builder: (context, laporanProvider, child) {
          if (laporanProvider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          final laporanList = laporanProvider.laporanKas.toList();

          return ListView.builder(
            itemCount: laporanList.length,
            itemBuilder: (context, index) {
              final laporan = laporanList[index];
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailLaporanPage(
                          title: 'Kas Masjid Minggu ${index + 1}',
                          amount: 'Rp ${laporan.totalSaldo}',
                          date: laporan.tanggal,
                          rincian: {
                            'Amal Jumat': 'Rp 470.000',
                            'Amal Harian': 'Rp 30.000',
                          },
                        ),
                      ),
                    );
                  },
                  child: LaporanCard(
                    title: laporan.judul,
                    amount: laporan.totalSaldo.toString(),
                    date: laporan.tanggal,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
