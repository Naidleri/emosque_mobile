import 'package:flutter/material.dart';

class DetailLaporanPage extends StatelessWidget {
  final String title;
  final String amount;
  final String date;
  final Map<String, String> rincian;

  const DetailLaporanPage({
    Key? key,
    required this.title,
    required this.amount,
    required this.date,
    required this.rincian,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Laporan Mingguan', style: TextStyle(color: Colors.white,)),
        backgroundColor: Color(0xff06D773),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: IntrinsicHeight(
            child: Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: BorderSide(
                  color: Color(0xFF225779),
                  width: 1.0,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal:  20.0, vertical: 40.00),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        title,
                        style: TextStyle(color: Color(0xff06D773), fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 2.0),
                    Text(
                      'Rincian',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold, color: Color(0xFF225779)),
                    ),
                    SizedBox(height: 20.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: rincian.entries
                          .map((entry) => ListTile(
                                leading: Text('\u2022'),
                                title: Text(
                                  entry.key,
                                  style: TextStyle(fontSize: 16.0, color: Color(0xFF225779)),
                                ),
                                trailing: Text(
                                  entry.value,
                                  style: TextStyle(fontSize: 16.0, color: Color(0xFF225779)),
                                ),
                              ))
                          .toList(),
                    ),
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total',
                          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Color(0xFF225779)),
                        ),
                        Text(
                          amount,
                          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Color(0xFF225779)),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0,),
                    Column(
                      children: [
                        Center(
                          child: Text(
                            'Tanggal',
                            style: TextStyle(fontSize: 16.0, color: Color(0xFF225779)),
                          ),
                        ),
                        Center(
                          child: Text(
                            date,
                            style: TextStyle(fontSize: 16.0, color: Color(0xFF225779)),
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
