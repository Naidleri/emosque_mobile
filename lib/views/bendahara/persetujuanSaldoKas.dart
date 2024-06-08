// ignore_for_file: file_names
import 'package:emosque_mobile/widgets/button.dart';
import 'package:emosque_mobile/widgets/fillButton.dart';
import 'package:emosque_mobile/widgets/form.dart';
import 'package:emosque_mobile/widgets/formDeskripsi.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PersetujuanSaldoKas extends StatelessWidget {
  const PersetujuanSaldoKas({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: const Icon(Icons.arrow_back_ios_new),
          title: Text(
            "Persetujuan Saldo Kas",
            style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.green[700]),
          ),
        ),
        body: ListView(
          children:  [
            Column(
              children: [
                form(
                  title: "Judul Persetujuan",
                  hint: "Masukkan Judul Persetujuan",
                ),
                form(
                  title: "Nominal",
                  hint: "Masukkan Nominal",
                ),
                formDeskripsi(
                  title: "Deskripsi",
                  hint: "Masukkan Deskripsi Pemasukan",
                ),
                formDeskripsi(
                  title: "Keterangan",
                  hint: "Telah Disetujui Takmir",
                ),
                
                SizedBox(
                  height: 201,
                ),
                fillButton(
                  text: "Cetak Persetujuan", onPressed: (){},
                ),
                SizedBox(
                  height: 11,
                ),
                Button(text: "Hapus Persetujuan"),
                SizedBox(height: 21,)
              ],
            ),
          ],
        ),
      ),
    );
  }
}


