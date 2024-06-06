import 'package:emosque_mobile/models/models.dart';
import 'package:emosque_mobile/providers/providers.dart';
import 'package:emosque_mobile/views/sekertaris/dropdown_zakat.dart';
import 'package:emosque_mobile/views/sekertaris/input_form.dart';
import 'package:emosque_mobile/views/sekertaris/read_zakat_sekertaris.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateZakatSekertaris extends StatefulWidget {
  @override
  State<CreateZakatSekertaris> createState() => _CreateZakatSekertarisState();
}

class _CreateZakatSekertarisState extends State<CreateZakatSekertaris> {
  final TextEditingController _namacontroller = TextEditingController();
  final TextEditingController _jumlahcontroller = TextEditingController();
  String jenis = 'Beras';

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
            InputForm(
              controller: _namacontroller,
              judul: "Nama Pezakat",
              hint: "Masukkan Nama Pezakat",
            ),
            InputForm(
              controller: _jumlahcontroller,
              judul: "Jumlah Zakat",
              hint: "Masukkan Jumlah Zakat",
            ),
            DropdownZakat(
              initialValue: jenis,
              onChanged: (newValue) {
                setState(() {
                  jenis = newValue ?? 'Beras';
                });
              },
              options: const ['Beras', 'Uang Tunai'],
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
            if (_namacontroller.text.isEmpty ||
                _jumlahcontroller.text.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Data tidak boleh kosong"),
                ),
              );
              return;
            }

            int jenisToValue(String jenis) {
              switch (jenis) {
                case 'Beras':
                  return 1;
                case 'Uang':
                  return 2;
                default:
                  return 0;
              }
            }

            final newZakat = CreateZakat(
                nama: _namacontroller.text,
                jumlah: int.parse(_jumlahcontroller.text),
                jenis: jenisToValue(jenis));
            final _zakatProvider =
                Provider.of<ZakatProvider>(context, listen: false);
            _zakatProvider
                .createZakat(newZakat)
                .then((_) => Navigator.pushReplacementNamed(
                    context, '/readZakatFitrahSekertaris'))
                .catchError((error) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Gagal menambahkan zakat'),
                ),
              );
            });
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
