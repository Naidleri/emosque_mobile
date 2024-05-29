import 'package:emosque_mobile/views/sekertaris/tambah_zakat.dart';
import 'package:emosque_mobile/views/sekertaris/update_zakat.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class ZakatFitrah extends StatefulWidget{
  @override
  State<ZakatFitrah> createState() => _ZakatFitrahState();
}

class _ZakatFitrahState extends State<ZakatFitrah> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border(top: BorderSide(
                      color: Color.fromRGBO(172, 172, 172, 1),
                      width: 0.7),
                      ),
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.only(left: 25, right: 25),
                      title: Text(
                        "Agus Subandoko",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w500
                        ),
                        ),
                      subtitle: Text(
                        "Uang Tunai",
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w400
                        ),
                        ),
                        trailing: Text(
                          "Rp 50.000",
                          style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w400
                        ),
                          ),
                    ), 
                ),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(padding: EdgeInsets.symmetric(horizontal: 65)),
                  SizedBox(
                    width: 105,
                    height: 30,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                         shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)
                        )
                      ),
                      onPressed: (){},
                      child: Row(
                        children: [
                          Icon(
                            Icons.delete,
                            color: Colors.white,
                            size: 15),
                            SizedBox(width: 10),
                          Text(
                            "Delete",
                             style: GoogleFonts.poppins(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: Colors.white
                              
                            ),
                            )
                        ],
                      )),
                  ),
                  SizedBox(width: 5),
                  SizedBox(
                    width: 110,
                    height: 30,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(55, 163, 165, 1),
                         shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)
                        )
                      ),
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(
                        builder: (context) => updateZakat(),
                        ));
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.update,
                            color: Colors.white,
                            size: 15,),
                            SizedBox(width: 10),
                          Text(
                            "Update",
                             style: GoogleFonts.poppins(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: Colors.white
                            ),
                            )
                        ],
                      )),
                  ),
                ],
              ),
              ],
            ),
      ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Container(
        height: 50,
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
              builder: (context) => tambahZakat(),
              ));
          },
          child: const Center(
            child: Text(
              'Tambah Catatan',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20
              ),),
          ),
        ),
      ),
    );
    
  }
}