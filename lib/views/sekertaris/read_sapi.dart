import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:emosque_mobile/models/models.dart';

class ReadSapi extends StatelessWidget {
  final Qurban qurban;

  const ReadSapi({required this.qurban, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          padding: const EdgeInsets.only(left: 20),
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 25,
          ),
        ),
        title: Text(
          "Qurban",
          style: GoogleFonts.poppins(
              color: const Color.fromRGBO(6, 215, 115, 1),
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
              child: ListTile(
                contentPadding: const EdgeInsets.only(top: 12, left: 25, right: 25),
                title: Text(
                  qurban.nama,
                  style: GoogleFonts.poppins(
                      fontSize: 20, fontWeight: FontWeight.w500),
                ),
                subtitle: Text(
                  qurban.deskripsi,
                  style: GoogleFonts.poppins(
                      fontSize: 17, fontWeight: FontWeight.w400),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Column(
              children: [
                Container(
                  child: ListTile(
                    contentPadding:
                        const EdgeInsets.only(top: 12, left: 25, right: 25),
                    title: Text(
                      "Sapi",
                      style: GoogleFonts.poppins(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                Image.network(
                  'https://pbm2024.site/public/${qurban.dokumentasi}',
                  width: 150,
                  height: 100,
                  fit: BoxFit.cover,
                  alignment: Alignment.topLeft,
                ),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(padding: EdgeInsets.symmetric(horizontal: 50)),
                SizedBox(
                  width: 120,
                  height: 30,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5))),
                      onPressed: () {},
                      child: const Row(
                        children: [
                          Icon(Icons.delete, color: Colors.white, size: 17),
                          SizedBox(width: 10),
                          Text(
                            "Delete",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      )),
                ),
                const SizedBox(width: 5),
                SizedBox(
                  width: 120,
                  height: 30,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(55, 163, 165, 1),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5))),
                      onPressed: () {
                        // Navigator.push(context, MaterialPageRoute(
                        // builder: (context) => updateZakat(),
                        // ));
                      },
                      child: const Row(
                        children: [
                          Icon(
                            Icons.update,
                            color: Colors.white,
                            size: 17,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Update",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
