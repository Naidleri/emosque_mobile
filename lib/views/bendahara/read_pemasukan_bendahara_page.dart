import 'package:emosque_mobile/providers/providers.dart';
import 'package:emosque_mobile/views/bendahara/update_pemasukan_bendahara.dart';
import 'package:emosque_mobile/widgets/picker_date.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ReadPemasukanBendaharaPage extends StatefulWidget {
  const ReadPemasukanBendaharaPage({super.key});

  @override
  State<ReadPemasukanBendaharaPage> createState() =>
      _ReadPemasukanBendaharaPageState();
}

class _ReadPemasukanBendaharaPageState
    extends State<ReadPemasukanBendaharaPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<KasProvider>(context, listen: false).getAllKas();
    });
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

  Widget cardHistoryPemasukan(
      String judul, String tanggal, int nominal, VoidCallback onPressed) {
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
          "Pemasukan",
          style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Colors.green[700]),
        ),
        centerTitle: true,
      ),
      body: Consumer<KasProvider>(
        builder: (context, kasProvider, child) {
          if (kasProvider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          final pemasukanList = kasProvider.saldoKas
              .where((kas) => kas.jenis == 'pemasukan')
              .toList();

          return Padding(
            padding: const EdgeInsets.only(bottom: 90), // Menambahkan padding 40
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const PickerDate(),
                search(),
                Expanded(
                  child: ListView.builder(
                    itemCount: pemasukanList.length,
                    itemBuilder: (context, index) {
                      final kas = pemasukanList[index];
                      return cardHistoryPemasukan(
                          kas.judul,
                          kas.tanggal,
                          kas.nominal,
                          () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UpdatePemasukanBendahara(
                                  idKas: kas.idSaldoKas,
                                  judul: kas.judul,
                                  tanggal: kas.tanggal,
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
            ),
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
                Navigator.pushNamed(context, '/createPemasukanBendahara');
              },
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.green[700]),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
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
            ),
          ),
        ],
      ),
    );
  }
}
