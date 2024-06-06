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
  String jenis = 'Beras';
  late String namaPezakat;
  late int jumlahZakat;

  @override
  void initState() {
    super.initState();
    namaPezakat = '';
    jumlahZakat = 0;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    if (args != null) {
      setState(() {
        namaPezakat = args['namaPezakat'] ?? '';
        jumlahZakat = args['jumlahZakat'] ?? 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Zakat Fitrah",
          style: GoogleFonts.poppins(
            color: Colors.green[700],
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text('Nama Pezakat'),
                  const SizedBox(height: 3),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Masukkan nama pezakat',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                    ),
                    initialValue: namaPezakat,
                    onChanged: (value) {
                      namaPezakat = value;
                    },
                  ),
                  const Text('Jumlah Zakat'),
                  const SizedBox(height: 3),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Masukkan jumlah zakat',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                    ),
                    initialValue: jumlahZakat.toString(),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      jumlahZakat = int.tryParse(value) ?? 0;
                    },
                  ),
                ],
              ),
            ),
            DropdownZakat(
              initialValue: jenis,
              onChanged: (newValue) {
                setState(() {
                  jenis = newValue ?? 'Beras';
                });
              },
              options: ['Beras', 'Uang'],
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
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            backgroundColor: const Color.fromRGBO(55, 163, 165, 1),
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/readZakatSekertaris');
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
