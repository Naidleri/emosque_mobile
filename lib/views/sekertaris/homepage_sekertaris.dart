import 'package:emosque_mobile/views/sekertaris/calender_seker.dart';
import 'package:emosque_mobile/views/sekertaris/list_perizinan.dart';
import 'package:emosque_mobile/views/sekertaris/read_qurban.dart';
import 'package:emosque_mobile/views/sekertaris/yayasan.dart';
import 'package:emosque_mobile/views/sekertaris/zakat_fitrah.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyHomepageSekertaris extends StatefulWidget {
  const MyHomepageSekertaris({super.key});

  @override
  State<MyHomepageSekertaris> createState() => _MyHomepageSekertarisState();
}

class _MyHomepageSekertarisState extends State<MyHomepageSekertaris> {
  Widget cardMenu(String gambar, String text, VoidCallback onTap,
      {Widget? icon, Color? color}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(top: 12),
        width: 90,
        height: 110,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all()),
              child: Image.asset(gambar),
            ),
            Text(
              text,
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.blueGrey[800],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'E-Mosque',
          style: TextStyle(
              color: Color(0xff06d773),
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 27.5),
                height: size.height * 0.2,
                width: size.width * 0.9,
                padding: const EdgeInsets.only(left: 20, top: 30),
                decoration: BoxDecoration(
                    color: const Color(0xff06d773),
                    borderRadius: BorderRadius.circular(10)),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '20 hari lagi',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Hari Qurban',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 45,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 7.5,
                    ),
                    Text(
                      '20 march 2024',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  cardMenu('assets/images/icon-beranda-sekre-1.png', 'Perizinan', () {Navigator.push(context, MaterialPageRoute(builder: (context) => const MyListPerizinan())); }),
                  cardMenu('assets/images/icon-beranda-sekre-2.png', 'Zakat', () {Navigator.push(context, MaterialPageRoute(builder: (context) => ZakatFitrah())); }),
                  cardMenu('assets/images/icon-beranda-sekre-3.png', 'Qurban', () {Navigator.push(context, MaterialPageRoute(builder: (context) => ReadQurban())); }),
                  cardMenu('assets/images/icon-beranda-sekre-3.png', 'Yayasan', () {Navigator.push(context, MaterialPageRoute(builder: (context) => Yayasan())); }),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
