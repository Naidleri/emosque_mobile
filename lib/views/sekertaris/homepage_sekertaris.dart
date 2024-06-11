import 'package:emosque_mobile/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomepageSekertaris extends StatefulWidget {
  const HomepageSekertaris({super.key});

  @override
  State<HomepageSekertaris> createState() => _HomepageSekertarisState();
}

class _HomepageSekertarisState extends State<HomepageSekertaris> {
  DateTime waktu = DateTime.now();
  String getFormattedDate() {
    return DateFormat('d MMMM y').format(waktu);
  }

  String getDayName() {
    return DateFormat('EEEE').format(waktu);
  }

  Widget cardMenu(String gambar, String text, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), border: Border.all()),
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
    final _userProvider = Provider.of<UserProvider>(context, listen: false);
    final _userData = _userProvider.users.first;
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Selamat datang ${_userData.name}',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      getDayName(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      getFormattedDate(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
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
                    Navigator.of(context)
                        .pushNamed('/readZakatFitrahSekertaris');
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
