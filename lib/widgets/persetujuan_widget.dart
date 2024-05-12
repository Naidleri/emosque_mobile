import 'package:flutter/material.dart';
import 'package:emosque_mobile/utils/const.dart';
import 'package:emosque_mobile/views/bendahara/persetujuan_saldo_kas.dart';

class PersetujuanSaldoKas extends StatefulWidget {
  const PersetujuanSaldoKas({Key? key}) : super(key: key);

  @override
  State<PersetujuanSaldoKas> createState() => _PersetujuanSaldoKasState();
}

class _PersetujuanSaldoKasState extends State<PersetujuanSaldoKas> {
  Widget cardHistoryPengeluaran(String judul, String tanggal, String uang) {
    return InkWell(
      onTap: () {
        // Implementasi ketika card diklik
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.grey),
            bottom: BorderSide(color: Colors.grey),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  judul,
                  style: blackTextStyle.copyWith (
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  tanggal,
                  style: greyTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            Text(
              uang,
              style: blackTextStyle.copyWith(fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          cardHistoryPengeluaran("Pembangunan", "19 April 2024", "Rp 850.000"),
          cardHistoryPengeluaran("Santunan anak yatim", "15 April 2024", "Rp 550.000"),
          cardHistoryPengeluaran("Konsumsi Rapat", "12 April 2024", "Rp 450.000"),
          cardHistoryPengeluaran("Air", "10 April 2024", "Rp 600.000"),
          cardHistoryPengeluaran("Alat Kebersihan", "8 April 2024", "Rp 312.000"),
          cardHistoryPengeluaran("Listrik", "8 April 2024", "Rp 800.000"),
          cardHistoryPengeluaran("Santunan anak yatim", "1 April 2024", "Rp 1.850.000"),
        ],
      ),
      bottomSheet: Container(
        width: MediaQuery.of(context).size.width,
        height: 90,
        color: Colors.white,
        child: ElevatedButton(
          onPressed: () {
            // Implementasi ketika tombol "Tambahkan Pengeluaran" diklik
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.green),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          child: const Text(
            "Tambahkan Pengeluaran",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Colors.white,
              
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: PersetujuanSaldoKas(),
  ));
}