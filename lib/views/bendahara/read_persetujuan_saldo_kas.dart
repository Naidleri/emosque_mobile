import 'package:emosque_mobile/widgets/listTile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReadPersetujuanSaldoKas extends StatefulWidget {
  const ReadPersetujuanSaldoKas({super.key});

  @override
  State<ReadPersetujuanSaldoKas> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ReadPersetujuanSaldoKas> {
  bool tombol = false;
  bool tombol1 = false;
  bool tombol2 = false;
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
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Container(
                  height: 50,
                  width: 170,
                  child: FilterChip(
                    label: const Text("Belum Disetujui"),
                    selected: tombol,
                    onSelected: (bool value) {
                      setState(() {
                        tombol = !tombol;
                      });
                    },
                  ),
                ),
                Container(
                  height: 50,
                  width: 100,
                  child: FilterChip(
                    label: const Text("Disetujui"),
                    selected: tombol1,
                    onSelected: (bool value) {
                      setState(() {
                        tombol1 = !tombol1;
                      });
                    },
                  ),
                ),
                Container(
                  height: 50,
                  width: 170,
                  child: FilterChip(
                    label: const Text("Tidak Disetujui"),
                    selected: tombol2,
                    onSelected: (bool value) {
                      setState(() {
                        tombol2 = !tombol2;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          listTile(
            tanggalAcc: "Minggu 2 April",
            tanggalPengajuan: "13 Apr 2024",
            nominal: "Rp 550.000",
          ),
          listTile(
            tanggalAcc: "Minggu 2 April",
            tanggalPengajuan: "13 Apr 2024",
            nominal: "Rp 550.000",
          ),
          listTile(
            tanggalAcc: "Minggu 2 April",
            tanggalPengajuan: "13 Apr 2024",
            nominal: "Rp 550.000",
          ),
          listTile(
            tanggalAcc: "Minggu 2 April",
            tanggalPengajuan: "13 Apr 2024",
            nominal: "Rp 550.000",
          ),
          SizedBox(
            height: 500,
          ),
          GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                    context, '/createPersetujuanSaldoKasBendahara');
              },
              child: Text(
                "Tambah Persetujuan",
              )),
        ],
      ),
    );
  }
}
