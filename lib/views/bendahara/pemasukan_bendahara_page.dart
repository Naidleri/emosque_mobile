import 'package:emosque_mobile/views/bendahara/update_pemasukan_bendahara.dart';
import 'package:emosque_mobile/widgets/picker_date.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PemasukanBendaharaPage extends StatefulWidget {
  const PemasukanBendaharaPage({super.key});

  @override
  State<PemasukanBendaharaPage> createState() => _PemasukanBendaharaPageState();
}

class _PemasukanBendaharaPageState extends State<PemasukanBendaharaPage> {
  String judul = "Santunan anak yatim";
  String date = "15 April 2024";
  int nominal = 550000;
  String deskripsi = "Untuk Bulan April";
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
                  hintText: 'Cari transaksi...',
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget cardHistoryPemasukan(
      String judul, String tanggal, int uang, VoidCallback onPressed) {
    return InkWell(
      onTap: onPressed,
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
              'Rp $uang',
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
          "Pemasukan",
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
          cardHistoryPemasukan(
            judul,
            date,
            nominal,
            () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UpdatePemasukanBendahara(
                      judul: judul, nominal: nominal, deskripsi: deskripsi),
                ),
              );
            },
          ),
          cardHistoryPemasukan(
            judul,
            date,
            nominal,
            () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UpdatePemasukanBendahara(
                      judul: judul, nominal: nominal, deskripsi: deskripsi),
                ),
              );
            },
          ),
          cardHistoryPemasukan(
            judul,
            date,
            nominal,
            () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UpdatePemasukanBendahara(
                      judul: judul, nominal: nominal, deskripsi: deskripsi),
                ),
              );
            },
          ),
          cardHistoryPemasukan(
            judul,
            date,
            nominal,
            () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UpdatePemasukanBendahara(
                      judul: judul, nominal: nominal, deskripsi: deskripsi),
                ),
              );
            },
          ),
          cardHistoryPemasukan(
            judul,
            date,
            nominal,
            () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UpdatePemasukanBendahara(
                      judul: judul, nominal: nominal, deskripsi: deskripsi),
                ),
              );
            },
          ),
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
                  Navigator.pushNamed(context, '/createPemasukanBendahara');
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
                  "Tambahkan Pemasukan",
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
