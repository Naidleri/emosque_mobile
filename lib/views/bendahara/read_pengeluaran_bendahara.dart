import 'package:emosque_mobile/providers/providers.dart';
import 'package:emosque_mobile/views/bendahara/update_pengeluaran_bendahara.dart';
import 'package:emosque_mobile/views/bendahara/update_persetujuan_saldo_kas.dart';
import 'package:emosque_mobile/widgets/picker_date.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ReadPengeluaranBendahara extends StatefulWidget {
  const ReadPengeluaranBendahara({super.key});

  @override
  State<ReadPengeluaranBendahara> createState() =>
      _ReadPengeluaranBendaharaState();
}

class _ReadPengeluaranBendaharaState extends State<ReadPengeluaranBendahara> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => Provider.of<KasProvider>(context, listen: false).getAllKas());
  }

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

  Widget cardHistoryPengeluaran(
      String judul, String tanggal, int nominal, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
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
              'Rp $nominal',
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
          "Pengeluaran",
          style: GoogleFonts.poppins(
              fontSize: 24, fontWeight: FontWeight.w700, color: Colors.green),
        ),
        centerTitle: true,
      ),
      body: Consumer<KasProvider>(
        builder: (context, kasProvider, child) {
          if (kasProvider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          final pemasukanList = kasProvider.saldoKas.where((kas) => kas.jenis == 'pengeluaran').toList();

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const PickerDate(),
              search(),
              Expanded(
                child: ListView.builder(
                  itemCount: pemasukanList.length,
                  itemBuilder: (context, index) {
                    final kas = pemasukanList[index];
                    return cardHistoryPengeluaran(
                      kas.judul,
                      kas.tanggal,
                      kas.nominal,
                      () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UpdatePengeluaranBendahara(
                              judul: kas.judul,
                              nominal: kas.nominal,
                              deskripsi: kas.deskripsi,
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          );
        },
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
                Navigator.pushNamed(context, '/createPengeluaranBendahara');
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
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
            ),
          ),
        ],
      ),
    );
  }
}
