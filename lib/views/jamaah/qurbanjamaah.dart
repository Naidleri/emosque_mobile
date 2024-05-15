// ignore_for_file: camel_case_types, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QurbanJamaah extends StatelessWidget {
  const QurbanJamaah({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            leading: const Icon(Icons.arrow_back_ios_new),
            title: Text(
              "Qurban",
              style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.greenAccent[700]),
            ),
          ),
          body: ListView(
            children: [
              Center(
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  margin: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.green),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 8.0),
                        child: Text("Nama orang qurban",
                            style: GoogleFonts.poppins(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.greenAccent[700])),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 8.0),
                        child: Text("tgl orang qurban",
                            style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                                color: Colors.greenAccent[700])),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 8.0),
                        child: Text("deskripsi",
                            style: GoogleFonts.poppins(
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                                color: Colors.greenAccent[700])),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 8.0),
                        child: Image.network("https://picsum.photos/293/158"),
                      ),
                      Container(
                          child: Text("Jenis Qurban",
                              style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.greenAccent[700])))
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

void main() {
  runApp(const QurbanJamaah());
}
