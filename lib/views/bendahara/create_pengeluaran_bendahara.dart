import 'package:emosque_mobile/widgets/calender.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CreatePengeluaranBendaharaPage extends StatelessWidget {
  CreatePengeluaranBendaharaPage({super.key});
  final judul = TextEditingController();
  final nominal = TextEditingController();
  final deskripsi = TextEditingController();
  Widget textField(String text, String hint, TextEditingController controller,
      BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: GoogleFonts.poppins(
                fontSize: 12, fontWeight: FontWeight.w400, color: Colors.black),
          ),
          const SizedBox(height: 5),
          SizedBox(
            height: 55,
            width: MediaQuery.of(context).size.width * 0.85,
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                  hintText: hint,
                  border: const OutlineInputBorder(),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.greenAccent))),
            ),
          )
        ],
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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              textField(
                  "Judul Pengeluaran", "Masukan Judul Pengeluaran", judul, context),
              textField("Nominal", "Masukan Nominal", nominal, context),
              textField("Deskripsi", "Masukan Deskripsi", deskripsi, context),
              const calender(),
              const SizedBox(
                height: 80,
              ),
              const Text(".")
            ],
          ),
        ),
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
                  Navigator.pop(context);
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.green),
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10.0), // Set corner radius
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
              ))
        ],
      ),
    );
  }
}

