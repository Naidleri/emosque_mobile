import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:emosque_mobile/utils/const.dart';
import '../../widgets/calender.dart';
class Pengeluaran extends StatelessWidget {
  const Pengeluaran ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(centerTitle: true, title: Text ('Pengeluaran'), titleTextStyle: textTextStyle.copyWith(fontSize: 24, fontWeight: bold)),
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 32) ,
          child: Column(
            mainAxisAlignment:MainAxisAlignment.center,
            children: [
              
              // Jenis Pengeluaran
              SizedBox(height: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Jenis Pengeluaran", 
                    style: blackTextStyle.copyWith(
                      fontSize: 12, 
                    ),
                  ),

                  SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: whiteColor, 
                      border: Border.all(color: blackColor.withOpacity(0.16) , width: 1),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Masukkan Judul Pengeluaran",
                        hintStyle: textTextStyle.copyWith(fontSize: 14, color: greyColor.withOpacity(0.6)),
                        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 17)
                      ),
                    ),
                  ),

                  // Nominal
                  SizedBox(height: 15),
                  Text(
                    "Nominal", 
                    style: blackTextStyle.copyWith(
                      fontSize: 12, 
                    ),
                  ),

                  SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: whiteColor, 
                      border: Border.all(color: blackColor.withOpacity(0.16) , width: 1),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Masukkan Nominal",
                        hintStyle: textTextStyle.copyWith(fontSize: 14, color: greyColor.withOpacity(0.6)),
                        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 17)
                      ),
                    ),
                  ),

                  // Deskripsi
                  SizedBox(height: 15),
                  Text(
                    "Deskripsi", 
                    style: blackTextStyle.copyWith(
                      fontSize: 12, 
                    ),
                  ),

                  SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: whiteColor, 
                      border: Border.all(color: blackColor.withOpacity(0.16) , width: 1),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Masukkan Deskripsi Pemasukan",
                        hintStyle: textTextStyle.copyWith(fontSize: 14, color: greyColor.withOpacity(0.6)),
                        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 17)
                      ),
                    ),
                  ),

                  calender(),  
                   
                   // Tambah Pengeluaran
                  SizedBox(height: 32),
                  Container(
                    width: double.infinity,
                    height: 50,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryButtonColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)
                        )
                      ),
                      onPressed: () {
                      //  Navigator.push(context, (PageTrans
                      //   child: (), 
                      //   type: PageTransitionType.rightToLeft)
                      //  );
                      }, 
                      child: Text("Tambah Pengeluaran", style: whiteTextStyle.copyWith()),
                    ),
                  ),
                ]
              )
            ]
          )
        )
      )
    );
  }
}