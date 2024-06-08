import 'package:emosque_mobile/widgets/laporan_detail.dart';
import 'package:flutter/material.dart';
import '../../widgets/laporan_card.dart';

class HomepageTakmir extends StatelessWidget {
  const HomepageTakmir({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Laporan', style: TextStyle(color: Colors.green[700], fontSize: 24.0, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Padding(
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
                      onPressed: () {
                        
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
              itemCount: 3,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailLaporanPage(
                          title: 'Kas Masjid Minggu ${index + 1}',
                          amount: 'Rp 500,000.00',
                          date: '20 Des 2023',
                          rincian: const {
                            'Amal Jumat': 'Rp 470.000',
                            'Amal Harian': 'Rp 30.000',
                          },
                        ),
                      ),
                    );
                  },
                  child: LaporanCard(
                    title: 'Kas Masjid Minggu ${index + 1}',
                    amount: 'Rp 500,000.00',
                    date: '20 Des 2023',
                  ),
                );
              },
            ),
            const SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}