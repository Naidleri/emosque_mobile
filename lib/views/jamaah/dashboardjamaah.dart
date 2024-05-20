import 'package:emosque_mobile/views/jamaah/navbarjamaah.dart';
import 'package:flutter/material.dart';
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
        ),
        body: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 6, 215, 115),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Total Saldo Kas',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.white, // Change text color to white
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Rp. 8.888.000',
                        style: GoogleFonts.poppins(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white, // Change text color to white
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Text(
                                'Total Pemasukan',
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  color: Colors
                                      .white, // Change text color to white
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'Rp. 800.000',
                                style: GoogleFonts.poppins(
                                  fontSize: 20,
                                  color: Colors
                                      .white, // Change text color to white
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                'Total Pengeluaran',
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  color: Colors
                                      .white, // Change text color to white
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'Rp. 700.000',
                                style: GoogleFonts.poppins(
                                  fontSize: 20,
                                  color: Colors
                                      .white, // Change text color to white
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.90,
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color.fromARGB(255, 55, 163, 165),
                    ),
                    child: Text(
                      "Qurban",
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        color: Colors.white, // Change text color to white
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        bottomNavigationBar: NavbarJamaah(),
      ),
    );
  }
}

void main() {
  runApp(const DashboardJamaah());
}
