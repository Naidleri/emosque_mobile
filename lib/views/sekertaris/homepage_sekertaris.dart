import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomepageSekertaris extends StatefulWidget {
  const HomepageSekertaris({super.key});

  @override
  State<HomepageSekertaris> createState() => _HomepageSekertarisState();
}

class _HomepageSekertarisState extends State<HomepageSekertaris> {
  Widget cardMenu(
    String gambar,
    String text,
    VoidCallback onTap
  ) {
    return InkWell(
      onTap: onTap,
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
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'E-Mosque',
          style: TextStyle(
              color: Colors.green[700],
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
                padding: const EdgeInsets.only(left: 20),
                height: size.height * 0.2,
                width: size.width * 0.9,
                decoration: BoxDecoration(
                    color: Colors.green[700],
                    borderRadius: BorderRadius.circular(10)),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
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
                  cardMenu(
                      'assets/images/icon-beranda-sekre-1.png', 'Perizinan',
                      () {
                    Navigator.of(context).pushNamed('/readPerizinanSekertaris');
                  }),
                  cardMenu('assets/images/icon-beranda-sekre-2.png', 'Zakat',
                      () {
                    Navigator.of(context).pushNamed('/readZakatFitrahSekertaris');
                  }),
                  cardMenu('assets/images/qurban.png', 'Qurban', () {
                    Navigator.of(context).pushNamed('/readQurbanSekertaris');
                  }),
                  cardMenu('assets/images/yayasan.png', 'Yayasan', () {
                    Navigator.of(context).pushNamed('/readYayasanSekertaris');
                  }),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
