import '../../widgets/picker_date.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RiwayatTransaksi extends StatefulWidget {
  const RiwayatTransaksi({super.key});

  @override
  State<RiwayatTransaksi> createState() =>
      _PengeluaranBendaharaPageState();
}

class _PengeluaranBendaharaPageState extends State<RiwayatTransaksi> {
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

  Widget cardRiwayat(Icon icon, String judul, String tanggal, String uang,
      VoidCallback onTap, double lebar) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: lebar,
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(99)),
                  padding: const EdgeInsets.all(8.0),
                  child: icon,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
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
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          "Riwayat Transaksi",
          style: GoogleFonts.poppins(
              fontSize: 24, fontWeight: FontWeight.w700, color: Colors.green),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const PickerDate(),
            search(),
            cardRiwayat(
            const Icon(Icons.arrow_back, size: 12, color: Colors.white),
            "Sumbangan",
            "26 April 2024",
            "Rp 850.000",
            () {}, 
            350.0, 
            ),
            cardRiwayat(
            const Icon(Icons.arrow_back, size: 12, color: Colors.white),
            "Hasil Wakaf",
            "19 April 2024",
            "Rp 800.000",
            () {}, 
            350.0, 
            ),
            cardRiwayat(
            const Icon(Icons.arrow_forward, size: 12, color: Colors.white),
            "Pembangunan",
            "19 April 2024",
            "Rp 850.000",
            () {}, 
            350.0, 
            ),
        
            cardRiwayat(
            const Icon(Icons.arrow_back, size: 12, color: Colors.white),
            "Kotak Amal",
            "19 April 2024",
            "Rp 200.000",
            () {}, 
            350.0, 
            ),
        
            cardRiwayat(
            const Icon(Icons.arrow_forward, size: 12, color: Colors.white,),
            "Santunan Anak Yatim",
            "15 April 2024",
            "Rp 850.000",
            () {}, 
            350.0, 
            ),
        
            cardRiwayat(
            const Icon(Icons.arrow_forward, size: 12, color: Colors.white,),
            "Konsumsi Rapat",
            "12 April 2024",
            "Rp 450.000",
            () {}, 
            350.0, 
            ),
        
            cardRiwayat(
            const Icon(Icons.arrow_back, size: 12, color: Colors.white,),
            "Kotak Amal",
            "8 April 2024",
            "Rp 150.000",
            () {}, 
            350.0, 
            ),
          ],
        ),
      ),
    );
  }
}