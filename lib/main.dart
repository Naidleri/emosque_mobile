import 'package:emosque_mobile/views/auth/login.dart';
import 'package:emosque_mobile/views/auth/register.dart';
import 'package:emosque_mobile/views/bendahara/createPersetujuanSaldoKas.dart';
import 'package:emosque_mobile/views/bendahara/create_pemasukan_bendahara_page.dart';
import 'package:emosque_mobile/views/bendahara/deletePersetujuanSaldokas.dart';
import 'package:emosque_mobile/views/bendahara/homepage_bendahara.dart';
import 'package:emosque_mobile/views/bendahara/pemasukan_bendahara_page.dart';
import 'package:emosque_mobile/views/bendahara/pengeluaran_bendahara_page.dart';
import 'package:emosque_mobile/views/bendahara/persetujuanSaldoKas.dart';
import 'package:emosque_mobile/views/bendahara/persetujuan_saldo_kas.dart';
import 'package:emosque_mobile/views/bendahara/readPersetujuanSaldoKas.dart';
import 'package:emosque_mobile/views/bendahara/riwayat_transaksi.dart';
import 'package:emosque_mobile/views/bendahara/tambah_pengeluaran.dart';
import 'package:emosque_mobile/views/bendahara/ubah_pengeluaran.dart';
import 'package:emosque_mobile/views/bendahara/updatePersetujuanSaldoKas.dart';
import 'package:emosque_mobile/views/bendahara/update_pemasukan_bendahara.dart';
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
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        'createPemasukanBendahara': (context) => CreatePemasukanBendaharaPage(),
        '/createPersetujuanSaldoKasBendahara': (context) =>
            const CreatePersetujuanSaldoKas(),
        '/deletePersetujuanSaldoKasBendahara': (context) =>
            const DeletePersetujuanSaldoKas(),
        '/homepageBendahara': (context) => const HomePageBendahara(),
        '/pemasukanBendahara': (context) => const PemasukanBendaharaPage(),
        '/pengeluaranBendahara': (cotext) => const PengeluaranBendaharaPage(),
        '/persetujuanSaldoKasApproveBendahara': (context) => ApprovePage(),
        '/persetujuanSaldoKasBendahara': (context) =>
            const PersetujuanSaldoKas(),
        '/readPersetujuanSaldoKasBendahara': (context) =>
            const ReadPersetujuanSaldoKas(),
        '/riwayatPengeluaranPageBendahara': (context) =>
            const PengeluaranBendaharaPage(),
        '/riwayatTransaksiBendahara': (context) => const riwayat_transaksi(),
        '/tambahPengeluaranBendahara': (context) => const Pengeluaran(),
        '/ubahPengeluaranBendahara': (context) => const UbahPengeluaran(),
        '/updatePemasukanBendahara': (context) =>
            const UpdatePemasukanBendahara(
                judul: "init", nominal: 0, deskripsi: "init"),
        'updatePersetujuanSaldoKasBendahara': (context) =>
            const UpdatePersetujuanSaldoKas(),
      },
      home: MyCreatePerizinan(),
    );
  }
}
