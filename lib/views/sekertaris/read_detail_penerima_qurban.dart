import 'package:emosque_mobile/views/sekertaris/update_zakat.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:emosque_mobile/models/models.dart';

class ReadDetailPenerimaQurban extends StatelessWidget {
  // final Qurban qurban;

  const ReadDetailPenerimaQurban({ super.key});

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
          "Detail Qurban",
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration:
                  const BoxDecoration(border: Border(top: BorderSide())),
              child: ListTile(
                contentPadding:
                    const EdgeInsets.only(top: 12, left: 25, right: 25),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nama Yayasan : ',
                      style: GoogleFonts.poppins(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Nama yayasan',
                      style: GoogleFonts.poppins(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                subtitle: Text(
                  'tanggal rekapan',
                  style: GoogleFonts.poppins(
                      fontSize: 17, fontWeight: FontWeight.w400),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               
                 ListTile(
                  contentPadding:
                      const EdgeInsets.only(top: 12, left: 25, right: 25),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Rekapan Daging Sapi : ",
                        style: GoogleFonts.poppins(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "200 Kg",
                        style: GoogleFonts.poppins(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  contentPadding:
                      const EdgeInsets.only(top: 12, left: 25, right: 25),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Rekapan Daging Kambing : ",
                        style: GoogleFonts.poppins(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "200 Kg",
                        style: GoogleFonts.poppins(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                Image.network(
                  'https://pbm2024.site/public/}',
                  width: MediaQuery.of(context).size.width * 0.9,
                  fit: BoxFit.cover,
                  alignment: Alignment.topLeft,
                ),
              ],
            ),
            const SizedBox(height: 30),
            LayoutBuilder(
              builder: (context, constraints) {
                double buttonWidth =
                    constraints.maxWidth * 0.4; // 40% of the screen width

                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: buttonWidth,
                      height: 40, // Increased height for better touch target
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        onPressed: () {
                          // Handle delete action
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.delete, color: Colors.white, size: 20),
                            SizedBox(width: 5),
                            Text(
                              "Delete",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    SizedBox(
                      width: buttonWidth,
                      height: 40, // Increased height for better touch target
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromRGBO(55, 163, 165, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        onPressed: () {
                          // Handle update action
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const UpdateZakatSekertaris(),
                              ));
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.update, color: Colors.white, size: 20),
                            SizedBox(width: 5),
                            Text(
                              "Update",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
