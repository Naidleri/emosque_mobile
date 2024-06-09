import 'package:provider/provider.dart';
import '../../widgets/picker_date.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:emosque_mobile/providers/providers.dart';

class RiwayatTransaksi extends StatefulWidget {
  const RiwayatTransaksi({super.key});

  @override
  State<RiwayatTransaksi> createState() => _RiwayatTransaksiState();
}

class _RiwayatTransaksiState extends State<RiwayatTransaksi> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
        () => Provider.of<KasProvider>(context, listen: false).getAllKas());
  }

  Widget search() {
    return Container(
      height: 60,
      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      padding: const EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          const Icon(Icons.search, color: Colors.black54),
          const SizedBox(width: 10.0),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: const TextField(
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
      VoidCallback onTap, double lebar, Color color) {
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
                      color: color, borderRadius: BorderRadius.circular(99)),
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

          final transaksiList = kasProvider.saldoKas.toList();

          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const PickerDate(),
              search(),
              Expanded(
                  child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: ListView.builder(
                  itemCount: transaksiList.length,
                  itemBuilder: (context, index) {
                    final transaksi = transaksiList[index];
                    return cardRiwayat(
                      Icon(
                        transaksi.jenis == 'pemasukan'
                            ? Icons.arrow_back
                            : Icons.arrow_forward,
                        size: 16,
                        color: Colors.white,
                      ),
                      transaksi.judul,
                      transaksi.tanggal,
                      "Rp ${transaksi.nominal}",
                      () {},
                      MediaQuery.of(context).size.width * 0.9,
                      transaksi.jenis == 'pemasukan'
                          ? Colors.green
                          : Colors.red,
                    );
                  },
                ),
              )),
            ],
          );
        },
      ),
    );
  }
}
