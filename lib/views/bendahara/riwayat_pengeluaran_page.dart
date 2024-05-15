import 'package:emosque_mobile/views/bendahara/tambah_pengeluaran.dart';
import 'package:flutter/widgets.dart';
import 'package:emosque_mobile/views/bendahara/ubah_pengeluaran.dart';
import 'package:emosque_mobile/views/bendahara/ubah_pengeluaran.dart';

import '../../widgets/picker_date.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PengeluaranBendaharaPage extends StatefulWidget {
  const PengeluaranBendaharaPage({super.key});

  @override
  State<PengeluaranBendaharaPage> createState() =>
      _PengeluaranBendaharaPageState();
}

class _PengeluaranBendaharaPageState extends State<PengeluaranBendaharaPage> {
  Widget search() {
    return Container(
      height: 60,
      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      padding: const EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      child: const Row(
        children: [
          // Icon
          Icon(Icons.search, color: Colors.black54),
          SizedBox(width: 10.0),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 12.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Cari transaksi',
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget cardHistoryPengeluaran(String judul, String tanggal, String uang) {
    return InkWell(
      onDoubleTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UbahPengeluaran(),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
            border: Border(
                top: BorderSide(color: Colors.grey),
                bottom: BorderSide(color: Colors.grey))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  judul,
                  style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  tanggal,
                  style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey),
                ),
              ],
            ),
            Text(
              uang,
              style: GoogleFonts.poppins(fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pengeluaran",
          style: GoogleFonts.poppins(
              fontSize: 24, fontWeight: FontWeight.w700, color: Colors.green),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const PickerDate(),
          search(),
          cardHistoryPengeluaran("Pembangunan", "19 April 2024", "Rp 850.000"),
          cardHistoryPengeluaran(
              "Santunan anak yatim", "15 April 2024", "Rp 550.000"),
          cardHistoryPengeluaran(
              "Konsumsi Rapat", "12 April 2024", "Rp 450.000"),
          cardHistoryPengeluaran("Air", "10 April 2024", "Rp 600.000"),
          cardHistoryPengeluaran(
              "Alat Kebersihan", "8 April 2024", "Rp 312.000"),
          cardHistoryPengeluaran("Listrik", "8 April 2024", "Rp 800.000"),
          cardHistoryPengeluaran(
              "Santunan anak yatim", "1 April 2024", "Rp 1.850.000")
        ],
      ),
      bottomSheet: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 90,
            color: Colors.white,
          ),
          Positioned(
              top: 10,
              right: 20,
              left: 20,
              bottom: 25,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UbahPengeluaran(),
                    ),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10.0), // Set corner radius
                    ),
                  ),
                ),
                child: Text(
                  "Tambahkan Pengeluaran",
                  style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
              ))
        ],
      ),
    );
  }
}
