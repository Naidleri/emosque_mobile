import 'package:emosque_mobile/models/models.dart';
import 'package:emosque_mobile/providers/providers.dart';
import 'package:emosque_mobile/widgets/calender.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class CreatePemasukanBendaharaPage extends StatefulWidget {
  CreatePemasukanBendaharaPage({super.key});

  @override
  State<CreatePemasukanBendaharaPage> createState() =>
      _CreatePemasukanBendaharaPageState();
}

class _CreatePemasukanBendaharaPageState
    extends State<CreatePemasukanBendaharaPage> {
  final judul = TextEditingController();
  final nominal = TextEditingController();
  final deskripsi = TextEditingController();
  DateTime? selectedDate;

  void _handleDateSelection(DateTime date) {
    setState(() {
      selectedDate = date;
    });
  }

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
                      borderSide: BorderSide(color: Colors.green))),
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
          "Pemasukan",
          style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Colors.green[700]),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              textField(
                  "Judul Pemasukan", "Masukan Judul Pemasukan", judul, context),
              textField("Nominal", "Masukan Nominal", nominal, context),
              textField("Deskripsi", "Masukan Deskripsi", deskripsi, context),
              Calender(onDateSelected: _handleDateSelection),
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
                  if (selectedDate == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Silakan pilih tanggal terlebih dahulu'),
                      ),
                    );
                    return;
                  }

                  final formattedDate =
                      DateFormat('yyyy-MM-dd').format(selectedDate!);

                  final newKas = SaldoKas(0, judul.text, 'pemasukan',
                      formattedDate, int.parse(nominal.text), deskripsi.text);
                  Provider.of<KasProvider>(context, listen: false)
                      .createKas(newKas)
                      .then((_) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Berhasil'),
                          content:
                              const Text('Data pemasukan berhasil ditambahkan'),
                          actions: [
                            ElevatedButton(
                              child: const Text('OK'),
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.pushNamed(
                                    context, '/readpemasukanbendahara');
                              },
                            ),
                          ],
                        );
                      },
                    );
                  }).catchError((error) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Gagal menambah data pemasukan'),
                      ),
                    );
                  });
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green[700]),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                child: Text(
                  "Tambahkan Pemasukan",
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
