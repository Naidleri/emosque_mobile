import 'package:emosque_mobile/models/models.dart';
import 'package:emosque_mobile/views/sekertaris/read_detail_penerima_qurban.dart';
import 'package:emosque_mobile/views/sekertaris/read_detail_penerima_zakat.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReadYayasanSekertaris extends StatefulWidget {
  const ReadYayasanSekertaris({super.key});

  @override
  State<ReadYayasanSekertaris> createState() => _ReadYayasanSekertarisState();
}

class _ReadYayasanSekertarisState extends State<ReadYayasanSekertaris>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this, initialIndex: 0);
  }

  Widget cardYayasan(String nama, String waktu, String jenis,
      VoidCallback onTap, BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 150,
        decoration: const BoxDecoration(
          border: Border(
            top:
                BorderSide(color: Color.fromRGBO(172, 172, 172, 1), width: 0.7),
            bottom:
                BorderSide(color: Color.fromRGBO(172, 172, 172, 1), width: 0.7),
          ),
        ),
        child: Column(
          children: [
            ListTile(
              contentPadding: const EdgeInsets.only(left: 25, right: 25),
              title: Text(
                nama,
                style: GoogleFonts.poppins(
                    fontSize: 16, fontWeight: FontWeight.w500),
              ),
              subtitle: Text(
                waktu,
                style: GoogleFonts.poppins(
                    fontSize: 12, fontWeight: FontWeight.w400),
              ),
              trailing: Text(
                jenis,
                style: GoogleFonts.poppins(
                    fontSize: 16, fontWeight: FontWeight.w400),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  height: 40,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.delete, color: Colors.white, size: 15),
                        const SizedBox(width: 5),
                        Text(
                          "Delete",
                          style: GoogleFonts.poppins(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  height: 40,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(55, 163, 165, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(
                          context, '/updatePenerimaZakatSekertaris');
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.update,
                          color: Colors.white,
                          size: 15,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          "Update",
                          style: GoogleFonts.poppins(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
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
          "Yayasan",
          style: GoogleFonts.poppins(
              color: Colors.green[700],
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.green[700],
          indicatorColor: Colors.green[700],
          tabs: const [
            Tab(text: 'Zakat'),
            Tab(text: 'Qurban'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                cardYayasan('Agus', '10 Des 2020', '11 Kg', () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const ReadDetailPenerimaZakat()));
                }, context),
                cardYayasan('Agus', '10 Des 2020', '11 Kg', () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const ReadDetailPenerimaZakat()));
                }, context)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                cardYayasan('Agus', '10 Des 2020', '11 Kg', () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) =>
                              const ReadDetailPenerimaQurban()));
                }, context),
                cardYayasan('Agus', '10 Des 2020', '11 Kg', () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) =>
                              const ReadDetailPenerimaQurban()));
                }, context),
              ],
            ),
          ),
        ],
      ),
      bottomSheet: Container(
        height: 50,
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            backgroundColor: Colors.green[700],
          ),
          onPressed: () {
            if (_tabController.index == 0) {
              Navigator.pushNamed(context, '/createPenerimaZakatSekertaris');
            } else {
              Navigator.pushNamed(context, '/createPenerimaQurbanSekertaris');
            }
          },
          child: const Center(
            child: Text(
              'Tambah Penerima',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
