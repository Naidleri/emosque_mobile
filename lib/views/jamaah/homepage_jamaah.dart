import 'package:emosque_mobile/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomepageJamaah extends StatelessWidget {
  const HomepageJamaah({super.key});

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
        final totalSaldo = 000;
        final totalPemasukan = 000;
        final totalPengeluaran = 000;

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
