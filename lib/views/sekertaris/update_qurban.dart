import 'package:flutter/material.dart';
import 'package:pengabdian_tasya/calender.dart';
import 'package:pengabdian_tasya/dropdown_qurban.dart';
import 'package:pengabdian_tasya/form.dart';
import 'package:google_fonts/google_fonts.dart';

class updateQurban extends StatefulWidget {
  @override
  State<updateQurban> createState() => _tambahZakatState();
}

class _tambahZakatState extends State<updateQurban> {
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
              inputForm(
                  judul: "Deskripsi",
                  hint: "Sapi ini dipilih dengan hati-hati"),
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
            backgroundColor: Color.fromRGBO(55, 163, 165, 1),
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
