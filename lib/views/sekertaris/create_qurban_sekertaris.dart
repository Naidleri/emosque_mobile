import 'dart:io';

import 'package:emosque_mobile/models/models.dart';
import 'package:emosque_mobile/providers/providers.dart';
import 'package:emosque_mobile/services/services.dart';
import 'package:flutter/material.dart';
import 'package:emosque_mobile/widgets/calender.dart';
import 'package:emosque_mobile/views/sekertaris/dropdown_qurban.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class CreateQurbanSekertaris extends StatefulWidget {
  @override
  State<CreateQurbanSekertaris> createState() => _CreateQurbanSekertarisState();
}

class _CreateQurbanSekertarisState extends State<CreateQurbanSekertaris> {
  final FlutterSecureStorage _secureStorage = FlutterSecureStorage();
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _deskripsiController = TextEditingController();
  File? _image;
  String jenis = 'Sapi';
  DateTime? selectedDate;
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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Qurban",
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
            SizedBox(
              width: size.width * 0.9,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text("Nama Orang Berqurban"),
                  const SizedBox(height: 5),
                  TextFormField(
                    controller: _namaController,
                    decoration: const InputDecoration(
                      hintText: 'Masukkan deskripsi kegiatan',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: size.width * 0.9,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text("Deskripsi"),
                  const SizedBox(height: 5),
                  TextFormField(
                    controller: _deskripsiController,
                    decoration: const InputDecoration(
                      hintText: 'Masukkan deskripsi kegiatan',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            DropdownQurban(
              initialValue: jenis,
              onChanged: (newValue) {
                setState(() {
                  jenis = newValue ?? 'Sapi';
                });
              },
              options: const ['Sapi', 'Kambing'],
            ),
            Calender(onDateSelected: _handleDateSelection),
            Container(
              margin: const EdgeInsets.only(top: 16, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Dokumentasi Qurban",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
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
                      child: _image == null
                          ? const Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.file_upload_outlined,
                                  size: 30,
                                  color: Color.fromRGBO(172, 172, 172, 1),
                                ),
                                Text(
                                  "Upload Gambar",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            )
                          : Image.file(
                              _image!,
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 40,
                  width: 110,
                  margin: const EdgeInsets.only(right: 30, bottom: 30, top: 20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      backgroundColor: Colors.green[700],
                    ),
                    onPressed: () async {
                      if (_namaController.text.isEmpty ||
                          _deskripsiController.text.isEmpty ||
                          selectedDate == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Data tidak boleh kosong"),
                          ),
                        );
                        return;
                      }
                
                      int jenisToValue(String jenisQurban) {
                        switch (jenisQurban) {
                          case 'Sapi':
                            return 1;
                          case 'Kambing':
                            return 2;
                          default:
                            return 0;
                        }
                      }
                
                      final formattedDate =
                          DateFormat('yyyy-MM-dd').format(selectedDate!);
                
                      try {
                        final storedToken = await _secureStorage.read(key: 'token');
                        if (storedToken == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Token tidak tersedia"),
                            ),
                          );
                          return;
                        }
                        var request = http.MultipartRequest('POST',
                            Uri.parse('https://pbm2024.site/public/api/qurban'));
                        final headers = ApiHelper.getHeaders(storedToken);
                        request.headers.addAll(headers);
                
                        request.fields['nama_orang_berqurban'] =
                            _namaController.text;
                        request.fields['tanggal'] = formattedDate;
                        request.fields['deskripsi'] = _deskripsiController.text;
                        request.fields['qurban_jenis_id'] =
                            jenisToValue(jenis).toString();
                
                        if (_image != null) {
                          var pic = await http.MultipartFile.fromPath(
                              'dokumentasi', _image!.path);
                          print('File Name: ${pic.filename}');
                          request.files.add(pic);
                        }
                
                        var response = await request.send();
                        var responseBody = await response.stream.bytesToString();
                
                        if (response.statusCode == 200) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Data qurban berhasil ditambahkan"),
                            ),
                          );
                          Navigator.pushNamed(context, '/readQurbanSekertaris');
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  'Gagal menambah data qurban. Status code: ${response.statusCode}, Message: $responseBody'),
                            ),
                          );
                        }
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Terjadi kesalahan: $e'),
                          ),
                        );
                      }
                
                     
                    },
                    child: const Row(
                      children: [
                        Icon(
                          Icons.add_circle_outline,
                          color: Colors.white,
                          size: 17,
                        ),
                        SizedBox(
                          width: 10,
                          height: 20,
                        ),
                        Text(
                          'Save',
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
