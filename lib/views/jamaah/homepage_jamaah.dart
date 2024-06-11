import 'package:emosque_mobile/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomepageJamaah extends StatefulWidget {
  const HomepageJamaah({super.key});

  @override
  State<HomepageJamaah> createState() => _HomepageJamaahState();
}

class _HomepageJamaahState extends State<HomepageJamaah> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => Provider.of<KasProvider>(context, listen: false).getAllKas());
  }
  Widget callUser() {
    final _userProvider = Provider.of<UserProvider>(context, listen: false);
    final _userData = _userProvider.users.first;
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Text(
        "Selamat datang ${_userData.name}",
        style:  TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.green[700]),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "E-Mosque",
          style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.green[700]),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              callUser(),
              mainCard(context),
              const SizedBox(height: 20),
              cardMenu('Qurban', const Color.fromARGB(255, 61, 169, 171), () {
                Navigator.pushNamed(context, '/qurbanJamaah');
              }, context)
            ],
          ),
        ],
      ),
    );
  }

  Widget cardMenu(
      String nama, Color warna, VoidCallback onTap, BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.86,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: warna,
          ),
          child: Text(
            nama,
            style: GoogleFonts.poppins(
              fontSize: 20,
              color: Colors.white, // Change text color to white
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  Widget mainCard(BuildContext context) {
    double lebar = MediaQuery.of(context).size.width * 0.86;
    return Consumer<KasProvider>(
      builder: (context, kasProvider, child) {
        if (kasProvider.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        final transaksiList = kasProvider.saldoKas.toList();

        // Menghitung total pemasukan, pengeluaran, dan saldo
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
                      padding:
                          const EdgeInsets.only(left: 25, right: 20, top: 10),
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
}
