
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QurbanJamaah extends StatelessWidget {
  const QurbanJamaah({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Qurban",
          style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.green),
        ),
      ),
      body: ListView(
        children: [
          Center(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              margin: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.green),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.86,
                    margin: const EdgeInsets.only(bottom: 8.0),
                    child: Text("Nama: Ace",
                        style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 8.0),
                    child: Text("12 Desember 2024",
                        style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                            color: Colors.black)),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 8.0),
                    child: Text("Saya berqurban sapi",
                        style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            color: Colors.black)),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.86,
                    margin: const EdgeInsets.only(bottom: 8.0),
                    child: Image.network("https://picsum.photos/293/158",),
                  ),
                  Text("Jenis Sapi",
                      style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          color: Colors.black))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

void main() {
  runApp(const QurbanJamaah());
}
