import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardJamaah extends StatelessWidget {
  const DashboardJamaah({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "E-Mosque",
            style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.greenAccent[700]),
          ),
          centerTitle: true,
        ),
        body: ListView(
          padding: EdgeInsets.all(16.0),
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
                "Rp 8.888.000",
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
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.white)),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text("Rp 800.000",
                            style: GoogleFonts.poppins(
                                fontSize: 12,
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
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.white)),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text("Rp 2.000.000",
                            style: GoogleFonts.poppins(
                                fontSize: 12,
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
  }
}
