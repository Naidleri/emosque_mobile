import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:emosque_mobile/models/models.dart';
import 'package:emosque_mobile/providers/providers.dart';
import 'package:emosque_mobile/widgets/calender.dart';
import 'input_form.dart';

class CreatePenerimaQurbanSekertaris extends StatefulWidget {
  const CreatePenerimaQurbanSekertaris({Key? key}) : super(key: key);

  @override
  State<CreatePenerimaQurbanSekertaris> createState() =>
      _CreatePenerimaQurbanSekertarisState();
}

class _CreatePenerimaQurbanSekertarisState
    extends State<CreatePenerimaQurbanSekertaris> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _namaYayasanController = TextEditingController();
  final TextEditingController _rekapanSapiController = TextEditingController();
  final TextEditingController _rekapanKambingController =
      TextEditingController();
  DateTime? selectedDate;
  File? _image;

  void _handleDateSelection(DateTime date) {
    setState(() {
      selectedDate = date;
    });
  }

  Future<void> _getImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedImage != null) {
        _image = File(pickedImage.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future<void> _submitForm() async {
    final formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate!);
    if (_formKey.currentState?.validate() ?? false) {
      final newYayasan = YayasanQurban(
        0,
        _namaYayasanController.text,
        formattedDate,
        int.parse(_rekapanSapiController.text),
        int.parse(_rekapanKambingController.text),
        '',
      );

      try {
        await Provider.of<YayasanQProvider>(context, listen: false)
            .createYayasan(newYayasan, _image);
        Navigator.pop(context);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to create Yayasan: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Penerima Qurban",
          style: GoogleFonts.poppins(
            color: Colors.green[700],
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              InputForm(
                judul: "Nama Yayasan",
                hint: "Masukkan Nama Yayasan",
                controller: _namaYayasanController,
              ),
              InputForm(
                judul: "Rekapan Daging Sapi",
                hint: "Masukkan Rekapan Daging Sapi",
                controller: _rekapanSapiController,
              ),
              InputForm(
                judul: "Rekapan Daging Kambing",
                hint: "Masukkan Rekapan Daging Kambing",
                controller: _rekapanKambingController,
              ),
              Container(
                margin: const EdgeInsets.only(top: 16, left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Tanggal Rekapan",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Calender(
                      onDateSelected: _handleDateSelection,
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 16,
                  left: 20,
                  right: 20,
                  bottom: 100,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Upload Bukti Surat",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    GestureDetector(
                      onTap: _getImage,
                      child: Container(
                        margin: const EdgeInsets.only(top: 16),
                        height: 86,
                        width: double.infinity,
                        padding: const EdgeInsets.only(left: 12),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color.fromRGBO(172, 172, 172, 1),
                            width: 0.7,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add_circle_outline,
                              color: Colors.grey,
                              size: 32,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              _image != null
                                  ? _image!.path.split('/').last
                                  : 'Upload File',
                              style: GoogleFonts.poppins(
                                color: const Color.fromRGBO(136, 136, 136, 1),
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _submitForm,
        backgroundColor: Colors.green[700],
        child: const Icon(Icons.save),
      ),
    );
  }
}
