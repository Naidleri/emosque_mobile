import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:emosque_mobile/views/sekertaris/read_yayasan_sekertaris.dart';

class Yayasan extends StatefulWidget {
  @override
  State<Yayasan> createState() => _YayasanState();
}

class _YayasanState extends State<Yayasan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Yayasan",
          style: GoogleFonts.poppins(
              color: Colors.green[700],
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(border: Border(top: BorderSide())),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ReadYayasanSekertaris()),
                      );
                    },
                    child: const ListTile(
                      contentPadding:
                          EdgeInsets.only(top: 12, left: 25, right: 25),
                      title: Text(
                        "Zakat Fitrah 1458 H",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      subtitle: Text(
                        "9 April 2024 - 10 April 2024 ",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w400),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 5),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        height: 50,
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            backgroundColor: Colors.green[700],
          ),
          onPressed: () {
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => readYayasan(),
            //     ));
          },
          child: const Center(
            child: Text(
              'Tambah Catatan',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
