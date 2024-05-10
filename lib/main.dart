import 'package:emosque_mobile/views/bendahara/create_pemasukan_bendahara_page.dart';
import 'package:emosque_mobile/views/bendahara/pemasukan_bendahara_page.dart';
import 'package:emosque_mobile/views/bendahara/pengeluaran_bendahara_page.dart';
import 'package:emosque_mobile/views/bendahara/readPersetujuanSaldoKas.dart';
import 'package:emosque_mobile/views/sekertaris/create_perizinan.dart';
import 'package:emosque_mobile/views/sekertaris/edit_perizinan.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/pengeluaran': (cotext) => const PengeluaranBendaharaPage(),
        '/pemasukan': (context) => const PemasukanBendaharaPage(),
        '/createpemasukan': (cotext) => CreatePemasukanBendaharaPage(),
        '/persetujuan': (context) => const ReadPersetujuanSaldoKas(),
      },
      home: MyCreatePerizinan(),
    );
  }
}
