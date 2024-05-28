import 'package:emosque_mobile/providers/providers.dart';
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
import 'package:emosque_mobile/views/jamaah/dashboardjamaah.dart';
import 'package:emosque_mobile/views/jamaah/kalenderjamaah.dart';
import 'package:emosque_mobile/views/jamaah/profile.dart';
import 'package:emosque_mobile/views/jamaah/qurbanjamaah.dart';
import 'package:emosque_mobile/views/sekertaris/bottom_bar_Seker.dart';
import 'package:emosque_mobile/views/sekertaris/calender_seker.dart';
import 'package:emosque_mobile/views/sekertaris/edit_perizinan.dart';
import 'package:emosque_mobile/views/sekertaris/homepage_sekertaris.dart';
import 'package:emosque_mobile/views/sekertaris/list_perizinan.dart';
import 'package:emosque_mobile/views/sekertaris/read_qurban.dart';
import 'package:emosque_mobile/views/sekertaris/read_sapi.dart';
import 'package:emosque_mobile/views/sekertaris/read_yayasan.dart';
import 'package:emosque_mobile/views/sekertaris/tambah_qurban.dart';
import 'package:emosque_mobile/views/sekertaris/tambah_zakat.dart';
import 'package:emosque_mobile/views/sekertaris/update_penerima_zakat.dart';
import 'package:emosque_mobile/views/sekertaris/update_qurban.dart';
import 'package:emosque_mobile/views/sekertaris/update_zakat.dart';
import 'package:emosque_mobile/views/sekertaris/yayasan.dart';
import 'package:emosque_mobile/views/sekertaris/zakat_fitrah.dart';
import 'package:emosque_mobile/views/takmir/laporan_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => KasProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ZakatProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => QurbanProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/login': (context) => const LoginPage(),
          '/register': (context) => const RegisterPage(),
          '/createPemasukanBendahara': (context) =>
              CreatePemasukanBendaharaPage(),
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
          '/dashboardJamaah': (context) => const DashboardJamaah(),
          '/kalenderJamaah': (context) => const KalenderJamaah(),
          '/profileJamah': (context) => const ProfileJamaah(),
          '/qurbanJamaah': (context) => const QurbanJamaah(),
          '/approveTakmir': (context) => ApprovePage(),
          'laporanPageTakmir': (context) => LaporanPage(),
          '/calenderSekertaris': (context) => const MyCalenderSeker(),
          '/editPerizinanSekertaris': (context) => const MyEditPerizinan(),
          '/homepageSekertaris': (context) => const MyHomepageSekertaris(),
          '/listPerizinanSekertaris': (context) => const MyListPerizinan(),
          '/readQurbanSekertaris': (context) => readQurban(),
          '/readSapiSekertaris': (context) => readSapi(),
          '/readYayasanSekertaris': (context) => readYayasan(),
          '/tambahQurbanSekertaris': (context) => tambahQurban(),
          '/tambahZakatSekertaris': (context) => tambahZakat(),
          '/updatePenerimaZakatSekertaris': (context) => updatePenerimaZakat(),
          '/updateQurbanSekertaris': (context) => updateQurban(),
          '/updateZakatSekertaris': (context) => updateZakat(),
          '/yayasanSekertaris': (context) => Yayasan(),
          '/zakatFitrahSekertaris': (context) => ZakatFitrah(),
        },
        home: const MyBottomBarSeker(),
      ),
    );
  }
}
