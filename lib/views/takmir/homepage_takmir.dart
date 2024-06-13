import 'package:emosque_mobile/providers/providers.dart';
import 'package:emosque_mobile/views/takmir/read_laporan_takmir.dart';
import 'package:emosque_mobile/widgets/detail_laporan_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../widgets/laporan_card.dart';

class HomepageTakmir extends StatefulWidget {
  const HomepageTakmir({super.key});

  @override
  State<HomepageTakmir> createState() => _HomepageTakmirState();
}

class _HomepageTakmirState extends State<HomepageTakmir> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => Provider.of<KasProvider>(context, listen: false).getAllKas());
    Future.microtask(() => Provider.of<LaporanProvider>(context, listen: false).getAllLaporan());
  }
Widget callUser() {
    final _userProvider = Provider.of<UserProvider>(context, listen: false);
    final _userData = _userProvider.users.first;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10, left: 30),
          child: Text(
            "Selamat datang ${_userData.name}",
            style:  TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.green[700]),
          ),
        ),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Laporan',
            style: TextStyle(
                color: Colors.green[700],
                fontSize: 24.0,
                fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          callUser(),
          Consumer<KasProvider>(
            builder: (context, kasProvider, child) {
              if (kasProvider.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              final transaksiList = kasProvider.saldoKas.toList();

              // Menghitung total pemasukan, pengeluaran, dan saldo
              final totalPemasukan = transaksiList
                  .where((transaksi) => transaksi.jenis == 'pemasukan')
                  .fold(0, (sum, transaksi) => sum + transaksi.nominal);
              final totalPengeluaran = transaksiList
                  .where((transaksi) => transaksi.jenis == 'pengeluaran')
                  .fold(0, (sum, transaksi) => sum + transaksi.nominal);
              final totalSaldo = totalPemasukan - totalPengeluaran;

              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Card(
                  color: Colors.green,
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text(
                          'Total Saldo Kas',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                          ),
                        ),
                        Text(
                          'Rp $totalSaldo',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 32.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Total Pemasukan',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16.0),
                                ),
                                const SizedBox(height: 5.0),
                                Text(
                                  'Rp $totalPemasukan',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Total Pengeluaran',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16.0),
                                ),
                                const SizedBox(height: 5.0),
                                Text(
                                  'Rp $totalPengeluaran',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          Expanded(
            child: Consumer<LaporanProvider>(
              builder: (context, laporanProvider, child) {
                if (laporanProvider.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                final laporanList = laporanProvider.laporanKas.toList();

                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Laporan perminggu Section
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Laporan perminggu',
                                style: TextStyle(
                                    fontSize: 18.0, fontWeight: FontWeight.bold),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) =>
                                              const ReadLaporanTakmir()));
                                },
                                child: const Text(
                                  'Lihat Semua',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF225779),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: laporanList.take(3).length,
                          itemBuilder: (context, index) {
                            final laporan = laporanList[index];
                            return GestureDetector(
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
                            );
                          },
                        ),
                        const SizedBox(height: 20.0),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
