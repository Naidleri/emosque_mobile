import 'package:flutter/material.dart';
import 'package:emosque_mobile/widgets/calender.dart';
import 'package:emosque_mobile/views/sekertaris/dropdown_qurban.dart';
import 'package:emosque_mobile/widgets/form.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:emosque_mobile/views/sekertaris/input_form.dart';

class tambahQurban extends StatefulWidget {
  @override
  State<tambahQurban> createState() => _tambahQurbanState();
}

class _tambahQurbanState extends State<tambahQurban> {
  String? jenis;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          padding: EdgeInsets.only(left: 20),
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back_ios,
            size: 25,
          ),
        ),
        title: Text(
          "Qurban",
          style: GoogleFonts.poppins(
              color: Color.fromRGBO(6, 215, 115, 1),
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              inputForm(judul: "Nama Orang Berqurban", hint: "Masukkan Nama"),
              inputForm(judul: "Deskripsi", hint: "Masukkan Deskripsi Qurban"),
              DropdownQurban(
                initialValue: jenis,
                onChanged: (newValue) {
                  setState(() {
                    jenis = newValue;
                  });
                },
              ),
              calender(),
              Container(
                margin: EdgeInsets.only(top: 16, left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Dokumentasi Qurban",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 16),
                      height: 86,
                      width: double.infinity,
                      padding: EdgeInsets.only(left: 12),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Color.fromRGBO(172, 172, 172, 1),
                              width: 0.7),
                          borderRadius: BorderRadius.circular(8)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.file_upload_outlined,
                            size: 30,
                            color: Color.fromRGBO(172, 172, 172, 1),
                          ),
                          Text("Upload Gambar",
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
            backgroundColor: Color.fromRGBO(6, 215, 115, 1),
          ),
          onPressed: () {
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => zakatFitrah(),
            //     ));
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
