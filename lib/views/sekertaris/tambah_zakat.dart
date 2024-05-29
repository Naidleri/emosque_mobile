import 'package:emosque_mobile/views/sekertaris/dropdown_zakat.dart';
import 'package:emosque_mobile/views/sekertaris/input_form.dart';
import 'package:emosque_mobile/views/sekertaris/zakat_fitrah.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class tambahZakat extends StatefulWidget{
  @override
  State<tambahZakat> createState() => _tambahZakatState();
}

class _tambahZakatState extends State<tambahZakat> {

  String? jenis;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          padding: EdgeInsets.only(left: 20),
          onPressed: (){},
          icon: Icon(
            Icons.arrow_back_ios,
            size: 25,
            ),
          ),
          title: Text(
            "Zakat Fitrah",
            style: 
            GoogleFonts.poppins(
              color: Color.fromRGBO(6, 215, 115, 1),
              fontSize: 25,
              fontWeight: FontWeight.bold
            ),),
          centerTitle: true,
      ),

      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              inputForm(judul: "Nama Pezakat", hint: "Masukkan Nama Pezakat"),
              inputForm(judul: "Jumlah Zakat", hint: "Masukkan Jumlah Zakat"),
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
      ),
      floatingActionButtonLocation:
        FloatingActionButtonLocation.endFloat,
        floatingActionButton: Container(
        height: 40,
        width: 110,
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5)
            ),
            backgroundColor: Color.fromRGBO(6, 215, 115, 1),
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => ZakatFitrah(),
              ));
          },
          child: const Center(
            child: Row(
              children: [
                Icon(
                            Icons.add_circle_outline,
                            color: Colors.white,
                            size: 17,),
                            SizedBox(width: 10),
                Text(
                  'Save',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16
                  ),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}