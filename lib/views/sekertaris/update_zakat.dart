import 'package:emosque_mobile/views/sekertaris/dropdown_zakat.dart';
import 'package:emosque_mobile/views/sekertaris/input_form.dart';
import 'package:emosque_mobile/views/sekertaris/read_zakat_sekertaris.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UpdateZakatSekertaris extends StatefulWidget {
  @override
  State<UpdateZakatSekertaris> createState() => _UpdateZakatSekertarisState();
}

class _UpdateZakatSekertarisState extends State<UpdateZakatSekertaris> {
  String? jenis;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Zakat Fitrah",
          style: GoogleFonts.poppins(
              color: Colors.green[700],
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const InputForm(
                judul: "Nama Pezakat", hint: "Masukkan Nama Pezakat"),
            const InputForm(
                judul: "Jumlah Zakat", hint: "Masukkan Jumlah Zakat"),
            DropdownZakat(
              initialValue: jenis,
              onChanged: (newValue) {
                setState(() {
                  jenis = newValue;
                });
              },
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Container(
        height: 40,
        width: 125,
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            backgroundColor: const Color.fromRGBO(55, 163, 165, 1),
          ),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ReadZakatSekertaris(),
                ));
          },
          child: const Center(
            child: Row(
              children: [
                Icon(
                  Icons.update,
                  color: Colors.white,
                  size: 17,
                ),
                SizedBox(width: 10),
                Text(
                  'Update',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
