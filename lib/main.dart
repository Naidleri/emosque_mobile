// import 'package:emosque_mobile/views/persetujuanSaldoKas.dart';
// import 'package:emosque_mobile/views/deletePersetujuanSaldoKas.dart';
import 'package:emosque_mobile/views/bendahara/create_pemasukan_bendahara_page.dart';
import 'package:emosque_mobile/views/bendahara/homepage_bendahara.dart';
import 'package:emosque_mobile/views/bendahara/pengeluaran_bendahara_page.dart';
// import 'package:emosque_mobile/views/readPersetujuanSaldoKas.dart';
// import 'package:emosque_mobile/views/persetujuanSaldoKas.dart';
// import 'package:emosque_mobile/views/updatePersetujuanSaldoKas.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/pengeluaran': (cotext) => const PengeluaranBendaharaPage(),
        '/createpemasukan': (cotext) => CreatePemasukanBendaharaPage(),
      },
      home: const HomePageBendahara(),
    );
  }
}

class CreatePemasukanBendahara {
  const CreatePemasukanBendahara();
}

class ReadPengeluaranBendahara {
  const ReadPengeluaranBendahara();
}