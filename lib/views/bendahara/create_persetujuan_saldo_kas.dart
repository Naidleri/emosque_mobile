// ignore_for_file: file_names
import 'package:emosque_mobile/widgets/calender.dart';
import 'package:emosque_mobile/widgets/fillButton.dart';
import 'package:emosque_mobile/widgets/form_deskripsi_widget.dart';
import 'package:emosque_mobile/widgets/form_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CreatePersetujuanSaldoKas extends StatefulWidget {
  const CreatePersetujuanSaldoKas({super.key});

  @override
  State<CreatePersetujuanSaldoKas> createState() => _CreatePersetujuanSaldoKasState();
}

class _CreatePersetujuanSaldoKasState extends State<CreatePersetujuanSaldoKas> {
    DateTime? selectedDate;
  void _handleDateSelection(DateTime date) {
    setState(() {
      selectedDate = date;
    });
  }
  final judul = TextEditingController();
  final saldoMasuk = TextEditingController();
  final saldoKeluar = TextEditingController();
  final deskripsi = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          children: [
            Column(
              children: [
                FormWidget(
                  title: "Judul Persetujuan",
                  hint: "Masukkan Judul Persetujuan",
                  controller: judul
                ),
                FormWidget(
                  title: "Saldo Masuk",
                  hint: "Masukkan Saldo Masuk",
                  controller: saldoMasuk
                ),
                FormWidget(
                  title: "Saldo Keluar",
                  hint: "Masukkan Saldo Keluar",
                  controller: saldoMasuk
                ),
                FormDeskripsiWidget(
                  title: "Deskripsi",
                  hint: "Masukkan Deskripsi Pemasukan", controller: deskripsi,
                ),
                Calender(onDateSelected: _handleDateSelection),
                const SizedBox(
                  height: 49,
                ),
                fillButton(
                  text: "Kirim Persetujuan", onPressed: (){},
                ),
                const SizedBox(
                  height: 36,
                )
              ],
            ),
          ],
        ),
    );
  }
}


