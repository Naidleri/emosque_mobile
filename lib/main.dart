import 'package:emosque_mobile/providers/providers.dart';
import 'package:emosque_mobile/views/auth/login.dart';
import 'package:emosque_mobile/views/auth/register_jamaah.dart';
import 'package:emosque_mobile/views/auth/register_pengurus.dart';
import 'package:emosque_mobile/views/bendahara/bottom_navigasi_bendahara.dart';
import 'package:emosque_mobile/views/bendahara/create_persetujuan_saldo_kas.dart';
import 'package:emosque_mobile/views/bendahara/create_pemasukan_bendahara_page.dart';
import 'package:emosque_mobile/views/bendahara/delete_persetujuan_saldo_kas.dart';
import 'package:emosque_mobile/views/bendahara/persetujuan_saldo_kas.dart';
import 'package:emosque_mobile/views/bendahara/read_pemasukan_bendahara_page.dart';
import 'package:emosque_mobile/views/bendahara/read_pengeluaran_bendahara.dart';
import 'package:emosque_mobile/views/bendahara/riwayat_transaksi.dart';
import 'package:emosque_mobile/views/bendahara/create_pengeluaran_bendahara.dart';
import 'package:emosque_mobile/views/jamaah/kalender_jamaah.dart';
import 'package:emosque_mobile/views/jamaah/bottom_navigasi_jamaah.dart';
import 'package:emosque_mobile/views/jamaah/profile_jamaah.dart';
import 'package:emosque_mobile/views/jamaah/qurban_jamaah.dart';
import 'package:emosque_mobile/views/sekertaris/bottom_navigasi_sekertaris.dart';
import 'package:emosque_mobile/views/sekertaris/calender_seker.dart';
import 'package:emosque_mobile/views/sekertaris/create_penerima_zakat_sekertaris.dart';
import 'package:emosque_mobile/views/sekertaris/create_perizinan_sekertaris.dart';
import 'package:emosque_mobile/views/sekertaris/update_perizinan_sekertaris.dart';
import 'package:emosque_mobile/views/sekertaris/read_perizinan_sekertaris.dart';
import 'package:emosque_mobile/views/sekertaris/read_qurban_sekertaris.dart';
import 'package:emosque_mobile/views/sekertaris/read_yayasan_sekertaris.dart';
import 'package:emosque_mobile/views/sekertaris/create_qurban_sekertaris.dart';
import 'package:emosque_mobile/views/sekertaris/create_zakat_sekertaris.dart';
import 'package:emosque_mobile/views/sekertaris/update_penerima_zakat.dart';
import 'package:emosque_mobile/views/sekertaris/update_qurban.dart';
import 'package:emosque_mobile/views/sekertaris/update_zakat.dart';
import 'package:emosque_mobile/views/sekertaris/yayasan.dart';
import 'package:emosque_mobile/views/sekertaris/read_zakat_sekertaris.dart';
import 'package:emosque_mobile/views/takmir/bottom_navigasi_takmir.dart';
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
        ChangeNotifierProvider(
          create: (_) => PerizinanProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          // akun
          '/login': (context) => const LoginPage(),
          '/registerJamaah': (context) => const RegisterJamaahPage(),
          '/registerPengurus': (context) => const RegisterPengurusPage(),
          // bendahara
          '/readpemasukanbendahara': (context) =>
              const ReadPemasukanBendaharaPage(),
          '/readpengeluaranbendahara': (context) =>
              const ReadPengeluaranBendahara(),
          '/readpersetujuanbendahara': (context) =>
              const ReadPersetujuanBendahara(),
          '/createPemasukanBendahara': (context) =>
              CreatePemasukanBendaharaPage(),
          '/createPengeluaranBendahara': (context) =>
              CreatePengeluaranBendaharaPage(),
          '/createPersetujuanSaldoKasBendahara': (context) =>
              const CreatePersetujuanSaldoKas(),
          '/deletePersetujuanSaldoKasBendahara': (context) =>
              const DeletePersetujuanSaldoKas(),
          '/homepageBendahara': (context) => const BottomNavigasiBendahara(),
          '/riwayatTransaksiBendahara': (context) => const RiwayatTransaksi(),
          // Jamaah
          '/homepageJamaah': (context) => const BottomNavigasiJamaah(),
          '/kalenderJamaah': (context) => const KalenderJamaah(),
          '/profileJamah': (context) => const ProfileJamaah(),
          '/qurbanJamaah': (context) => const QurbanJamaah(),
          // sekertaris
          '/homepageSekertaris': (context) => const BottomNavigasiSekertaris(),
          '/readPerizinanSekertaris': (context) =>
              const ReadPerizinanSekertaris(),
          '/readZakatFitrahSekertaris': (context) =>
              const ReadZakatSekertaris(),
          '/readQurbanSekertaris': (context) => const ReadQurbanSekertaris(),
          '/readYayasanSekertaris': (context) => const ReadYayasanSekertaris(),
          '/createPerizinanSekertaris': (context) =>
              const CreatePerizinanSekertaris(),
          '/createZakatSekertaris': (context) => CreateZakatSekertaris(),
          '/createQurbanSekertaris': (context) => CreateQurbanSekertaris(),
          '/createPenerimaZakatSekertaris': (context) =>
              CreatePenerimaZakatSekertaris(),
          '/updatePerizinanSekertaris': (context) =>
              const UpdatePerizinanSekertaris(),
          '/updatePenerimaZakatSekertaris': (context) =>
              const UpdatePenerimaZakatSekertaris(),
          '/updateQurbanSekertaris': (context) => const UpdateQurbanSekertaris(
                idQurban: 0,
              ),
          '/updateZakatSekertaris': (context) => const UpdateZakatSekertaris(),
          // '/readSapiSekertaris': (context) => ReadSapi(qurbanId: ,),
          '/yayasanSekertaris': (context) => Yayasan(),
          '/calenderSekertaris': (context) => const MyCalenderSeker(),
          // Takmir
          '/homepageTakmir': (context) => const BottomNavigasiTakmir(),
        },
        home: const LoginPage(),
      ),
    );
  }
}
