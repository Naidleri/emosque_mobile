import 'package:emosque_mobile/views/sekertaris/input_form.dart';
import 'package:flutter/material.dart';
import 'package:emosque_mobile/widgets/calender.dart';
import 'package:emosque_mobile/views/sekertaris/dropdown_qurban.dart';
import 'package:google_fonts/google_fonts.dart';

class UpdateQurbanSekertaris extends StatefulWidget {
  const UpdateQurbanSekertaris({super.key});

  @override
  State<UpdateQurbanSekertaris> createState() => _UpdateQurbanSekertarisState();
}

class _UpdateQurbanSekertarisState extends State<UpdateQurbanSekertaris> {
  String? jenis;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Qurban",
          style: GoogleFonts.poppins(
              color: const Color.fromRGBO(6, 215, 115, 1),
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const InputForm(
                judul: "Nama Orang Berqurban", hint: "Masukkan Nama"),
            const InputForm(
                judul: "Deskripsi", hint: "Sapi ini dipilih dengan hati-hati"),
            DropdownQurban(
              initialValue: jenis,
              onChanged: (newValue) {
                setState(() {
                  jenis = newValue;
                });
              },
            ),
            const calender(),
            Container(
              margin: const EdgeInsets.only(top: 16, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Dokumentasi Qurban",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 16),
                    height: 86,
                    width: double.infinity,
                    padding: const EdgeInsets.only(left: 12),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromRGBO(172, 172, 172, 1),
                            width: 0.7),
                        borderRadius: BorderRadius.circular(8)),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.file_upload_outlined,
                          size: 30,
                          color: Color.fromRGBO(172, 172, 172, 1),
                        ),
                        Text("Sapi.jpg",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w400)),
                      ],
                    ),
                  ),
                ],
              ),
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
            // Navigator.push(context, MaterialPageRoute(
            //   builder: (context) => zakatFitrah(),
            //   ));
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
