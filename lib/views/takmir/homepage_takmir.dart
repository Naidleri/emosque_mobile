import 'package:emosque_mobile/providers/providers.dart';
import 'package:emosque_mobile/widgets/laporan_detail.dart';
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
    Future.microtask(() => Provider.of<LaporanProvider>(context, listen: false).getAllLaporan());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Laporan', style: TextStyle(color: Colors.green[700], fontSize: 24.0, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Consumer<LaporanProvider>(
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
                  // Saldo Kas Section
                  const Card(
                    color: Colors.green,
                    child: Padding(
                      padding: EdgeInsets.all(25.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Total Saldo Kas',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.0,
                            ),
                          ),
                          Text(
                            'Rp 8.888.000',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 32.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Total Pemasukan',
                                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                                  ),
                                  SizedBox(height: 5.0),
                                  Text(
                                    'Rp 800.000',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Total Pengeluaran',
                                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                                  ),
                                  SizedBox(height: 5.0),
                                  Text(
                                    'Rp 2.000.000',
                                    style: TextStyle(
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
                  const SizedBox(height: 20.0),
                  // Laporan perminggu Section
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Laporan perminggu',
                          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                        TextButton(
                          onPressed: () {},
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
                    physics: NeverScrollableScrollPhysics(),
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
                                rincian: const {
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
    );
  }
}
