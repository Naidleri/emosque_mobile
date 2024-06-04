import 'package:emosque_mobile/views/sekertaris/dropdown_zakat.dart';
import 'package:emosque_mobile/views/sekertaris/input_form.dart';
import 'package:emosque_mobile/views/sekertaris/read_zakat_sekertaris.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateZakatSekertaris extends StatefulWidget {
  @override
  State<CreateZakatSekertaris> createState() => _CreateZakatSekertarisState();
}

class _CreateZakatSekertarisState extends State<CreateZakatSekertaris> {
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
        width: 110,
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            backgroundColor: Colors.green[700],
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
                  Icons.add_circle_outline,
                  color: Colors.white,
                  size: 17,
                ),
                SizedBox(width: 10),
                Text(
                  'Save',
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
