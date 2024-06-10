import 'package:emosque_mobile/views/sekertaris/update_zakat.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:emosque_mobile/models/models.dart';

class ReadDetailPenerimaZakat extends StatelessWidget {
  final Zakat zakat;

  const ReadDetailPenerimaZakat({required this.zakat, super.key});

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
          "zakat",
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
              decoration:
                  const BoxDecoration(border: Border(top: BorderSide())),
              child: ListTile(
                contentPadding:
                    const EdgeInsets.only(top: 12, left: 25, right: 25),
                title: Text(
                  zakat.namaPezakat,
                  style: GoogleFonts.poppins(
                      fontSize: 20, fontWeight: FontWeight.w500),
                ),
                subtitle: Text(
                  zakat.namaJenisZakat,
                  style: GoogleFonts.poppins(
                      fontSize: 17, fontWeight: FontWeight.w400),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Column(
              children: [
                ListTile(
                  contentPadding:
                      const EdgeInsets.only(top: 12, left: 25, right: 25),
                  title: Text(
                    "Sapi",
                    style: GoogleFonts.poppins(
                        fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
                Image.network(
                  'https://pbm2024.site/public/',
                  width: 150,
                  height: 100,
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
