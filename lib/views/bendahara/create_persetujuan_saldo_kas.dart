// ignore_for_file: file_names
import 'package:emosque_mobile/models/models.dart';
import 'package:emosque_mobile/providers/providers.dart';
import 'package:emosque_mobile/widgets/calender.dart';
import 'package:emosque_mobile/widgets/fillButton.dart';
import 'package:emosque_mobile/widgets/form_deskripsi_widget.dart';
import 'package:emosque_mobile/widgets/form_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CreatePersetujuanSaldoKas extends StatefulWidget {
  const CreatePersetujuanSaldoKas({super.key});

  @override
  State<CreatePersetujuanSaldoKas> createState() =>
      _CreatePersetujuanSaldoKasState();
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
          leading: const Icon(Icons.arrow_back_ios_new),
          title: Text(
            "Laporan Saldo Kas",
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
                  title: "Judul Laporan",
                  hint: "Masukkan Judul Laporan",
                  controller: judul),
              FormWidget(
                  title: "Saldo Masuk",
                  hint: "Masukkan Saldo Masuk",
                  controller: saldoMasuk),
              FormWidget(
                  title: "Saldo Keluar",
                  hint: "Masukkan Saldo Keluar",
                  controller: saldoKeluar),
              FormDeskripsiWidget(
                title: "Deskripsi",
                hint: "Masukkan Deskripsi Pemasukan",
                controller: deskripsi,
              ),
              Calender(onDateSelected: _handleDateSelection),
              const SizedBox(
                height: 49,
              ),
              fillButton(
                text: "Kirim Persetujuan",
                onPressed: () {
                  final laporanProvider =
                      Provider.of<LaporanProvider>(context, listen: false);
                  final totalSaldo = int.parse(saldoMasuk.text) >
                          int.parse(saldoKeluar.text)
                      ? int.parse(saldoMasuk.text) - int.parse(saldoKeluar.text)
                      : int.parse(saldoKeluar.text) -
                          int.parse(saldoMasuk.text);
                  final formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate!);
                  final newLaporan = LaporanKas(
                      0,
                      judul.text,
                      formattedDate,
                      int.parse(saldoMasuk.text),
                      int.parse(saldoKeluar.text),
                      totalSaldo,
                      deskripsi.text,
                      false,
                      '');
                  laporanProvider.createLaporan(newLaporan).then((_) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Berhasil'),
                          content: const Text(
                              'Data persetujuan berhasil ditambahkan'),
                          actions: [
                            ElevatedButton(
                              child: const Text('OK'),
                              onPressed: () {
                                // Navigator.pop(context);
                                Navigator.pushNamed(
                                    context, '/readpersetujuanbendahara');
                              },
                            ),
                          ],
                        );
                      },
                    );
                  }).catchError((error) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Gagal menambah data persetujuan'),
                      ),
                    );
                  });
                  Navigator.pop(context);
                },
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
