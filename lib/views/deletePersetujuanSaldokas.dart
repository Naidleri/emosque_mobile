// ignore_for_file: file_names
import 'package:emosque_mobile/widgets/button.dart';
import 'package:emosque_mobile/widgets/form.dart';
import 'package:emosque_mobile/widgets/formDeskripsi.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DeletePersetujuanSaldoKas extends StatelessWidget {
  const DeletePersetujuanSaldoKas({super.key});

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
                color: Colors.greenAccent[700]),
          ),
        ),
        body: ListView(
          children: const [
            Column(
              children: [
                form(
                  title: "Judul Persetujuan",
                  hint: "Minggu 2 April",
                ),
                form(
                  title: "Nominal",
                  hint: "Rp 50.000",
                ),
                formDeskripsi(
                  title: "Deskripsi",
                  hint: "-",
                ),
                formDeskripsi(
                  title: "Keterangan",
                  hint: "Tidak Disetujui Nominal Tidak Sesuai",
                ),
                
                SizedBox(
                  height: 201,
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


