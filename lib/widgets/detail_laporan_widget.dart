import 'package:flutter/material.dart';

class DetailLaporanPage extends StatelessWidget {
  final String title;
  final String amount;
  final String date;
  final Map<String, String> rincian;

  const DetailLaporanPage({
    super.key,
    required this.title,
    required this.amount,
    required this.date,
    required this.rincian,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Laporan Mingguan',
            style: TextStyle(
              color: Colors.white,
            )),
        backgroundColor: Colors.green[700],
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.7,
            child: Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: const BorderSide(
                  color: Color(0xFF225779),
                  width: 1.0,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 40.00),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Center(
                      child: Text(
                        title,
                        style: const TextStyle(
                            color: Color(0xFF225779),
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 2.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Rincian',
                          style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF225779)),
                        ),
                        const SizedBox(height: 20.0),
                        Column(
                          children: rincian.entries
                              .map((entry) => ListTile(
                                    title: Text(
                                      entry.key,
                                      style: const TextStyle(
                                          fontSize: 16.0,
                                          color: Color(0xFF225779)),
                                    ),
                                    trailing: Text(
                                      entry.value,
                                      style: const TextStyle(
                                          fontSize: 16.0,
                                          color: Color(0xFF225779)),
                                    ),
                                  ))
                              .toList(),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Total',
                          style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF225779)),
                        ),
                        Text(
                          amount,
                          style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF225779)),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40.0,
                    ),
                    Column(
                      children: [
                        const Center(
                          child: Text(
                            'Tanggal',
                            style: TextStyle(
                                fontSize: 16.0, color: Color(0xFF225779)),
                          ),
                        ),
                        Center(
                          child: Text(
                            date,
                            style: const TextStyle(
                                fontSize: 16.0, color: Color(0xFF225779)),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
