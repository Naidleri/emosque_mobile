import 'package:emosque_mobile/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageBendahara extends StatefulWidget {
  const HomePageBendahara({super.key});

  @override
  State<HomePageBendahara> createState() => _HomePageBendaharaState();
}

class _HomePageBendaharaState extends State<HomePageBendahara> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => Provider.of<KasProvider>(context, listen: false).getAllKas());
  }

  Widget mainCard(BuildContext context) {
    double lebar = MediaQuery.of(context).size.width * 0.86;
    return Consumer<KasProvider>(
      builder: (context, kasProvider, child) {
        final transaksiList = kasProvider.saldoKas.toList();

        // Calculate totals
        final totalPemasukan = transaksiList
            .where((transaksi) => transaksi.jenis == 'pemasukan')
            .fold(0, (sum, transaksi) => sum + transaksi.nominal);
        final totalPengeluaran = transaksiList
            .where((transaksi) => transaksi.jenis == 'pengeluaran')
            .fold(0, (sum, transaksi) => sum + transaksi.nominal);
        final totalSaldo = totalPemasukan - totalPengeluaran;

        return Center(
          child: Container(
            margin: const EdgeInsets.only(top: 30),
            width: lebar,
            height: 200,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                color: Colors.green),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 25, bottom: 10),
                  child: Text(
                    "Total Saldo Kas",
                    style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Text(
                    "Rp $totalSaldo",
                    style: GoogleFonts.poppins(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 25, right: 20, top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Total Pemasukan",
                              style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white)),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text("Rp $totalPemasukan",
                                style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white)),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Total Pengeluaran",
                              style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white)),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text("Rp $totalPengeluaran",
                                style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white)),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget cardMenu(String gambar, String text, VoidCallback onTap,
      {Widget? icon, Color? color}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(top: 12),
        width: 100,
        height: 110,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all()),
              child: icon != null
                  ? badges.Badge(
                      badgeContent: icon,
                      badgeStyle: badges.BadgeStyle(
                          badgeColor: color ?? Colors.transparent),
                      child: Image.asset(gambar),
                    )
                  : Image.asset(gambar),
            ),
            Text(
              text,
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.blueGrey[800],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget cardDropDown(Icon icon, String judul, String tanggal, String uang,
      VoidCallback onTap, double lebar, Color color) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: lebar,
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(99)),
                  padding: const EdgeInsets.all(8.0),
                  child: icon,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        judul,
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        tanggal,
                        style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Text(
              uang,
              style: GoogleFonts.poppins(fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double lebar = MediaQuery.of(context).size.width * 0.86;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        title: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 12, bottom: 8),
            child: Text(
              "E - Mosque",
              style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Colors.green[700]),
            ),
          ),
        ),
      ),
      body: Consumer<KasProvider>(
        builder: (context, kasProvider, child) {
          if (kasProvider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          final transaksiList = kasProvider.saldoKas.toList();

          return SingleChildScrollView(
            child: Column(children: [
              mainCard(context),
              Container(
                width: lebar,
                margin: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    cardMenu("assets/images/dompet.png", "Pemasukan", () {
                      Navigator.pushNamed(context, "/readpemasukanbendahara");
                    },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 18,
                        ),
                        color: Colors.green[700]),
                    cardMenu("assets/images/dompet.png", "Pengeluaran", () {
                      Navigator.pushNamed(context, "/readpengeluaranbendahara");
                    },
                        icon: const Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                          size: 18,
                        ),
                        color: Colors.red),
                    cardMenu(
                      "assets/images/persetujuan.png",
                      "Persetujuan\nSaldo Kas",
                      () {
                        Navigator.pushNamed(context, "/readpersetujuanbendahara");
                      },
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 30),
                width: lebar,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Transaksi terakhir",
                      style: GoogleFonts.poppins(
                          fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                    GestureDetector(
                      child: const Text(
                        "Lihat semua",
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, "/riwayatTransaksiBendahara");
                      },
                    )
                  ],
                ),
              ),
              ...transaksiList.take(3).map((transaksi) {
                return cardDropDown(
                  Icon(
                    transaksi.jenis == 'pemasukan' ? Icons.arrow_back : Icons.arrow_forward,
                    size: 16,
                    color: Colors.white,
                  ),
                  transaksi.judul,
                  transaksi.tanggal,
                  "Rp ${transaksi.nominal}",
                  () {},
                  lebar,
                  transaksi.jenis == 'pemasukan' ? Colors.green : Colors.red,
                );
              }).toList(),
            ]),
          );
        },
      ),
    );
  }
}
