import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class listTile extends StatelessWidget {
  final String tanggalAcc;
  final String tanggalPengajuan;
  final String nominal;

  const listTile(
      {super.key,
      required this.tanggalAcc,
      required this.tanggalPengajuan,
      required this.nominal});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(tanggalAcc,
          style: GoogleFonts.poppins(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black)),
      subtitle: Text(tanggalPengajuan,
          style: GoogleFonts.poppins(
              fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey)),
      trailing: Text(nominal,
          style: GoogleFonts.poppins(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black)),
    );
  }
}
