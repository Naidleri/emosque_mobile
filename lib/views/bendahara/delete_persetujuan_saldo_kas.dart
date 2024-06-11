// ignore_for_file: file_names
import 'package:emosque_mobile/widgets/button.dart';
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
          title: Text(
            "Persetujuan Saldo Kas",
            style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.green[700]),
          ),
        ),
        body: ListView(
          children: const [
            Column(
              children: [
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