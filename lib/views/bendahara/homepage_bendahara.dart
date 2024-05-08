import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  Widget mainCard(BuildContext context) {
    double lebar = MediaQuery.of(context).size.width * 0.86;
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 30),
        width: lebar,
        height: 200,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            color: Colors.green),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 30, left: 25, bottom: 10),
              child: Text(
                "Total Saldo Kas",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25),
              child: Text(
                "Rp 8.888.000",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 25, right: 20, top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Total Pemasukan",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.white)),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text("Rp 800.000",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.white)),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Total Pengeluaran",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.white)),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text("Rp 2.000.000",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.white)),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
  
  Widget cardMenu(String gambar, String text, VoidCallback onTap ,{Widget? icon, Color? color}) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: 100,
        height: 100,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), border: Border.all()),
              child: icon != null
                  ? badges.Badge(
                      badgeContent: icon,
                      badgeStyle: badges.BadgeStyle(
                          badgeColor: color ?? Colors.transparent),
                      child: Image.asset(gambar),
                    )
                  : Image.asset(gambar),
            ),
            Text(
              text,
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.blueGrey[800]),
            ),
          ],
        ),
      ),
    );
  }

  Widget cardDropDown(Icon icon, String judul, String tanggal, String uang) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(99)),
              padding: const EdgeInsets.all(8.0),
              child: icon,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  judul,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  tanggal,
                  style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
        Text(
          uang,
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    double lebar = MediaQuery.of(context).size.width * 0.86;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        title: const Center(
          child: Padding(
            padding: EdgeInsets.only(top: 8.0, left: 12, bottom: 8),
            child: Text(
              "E - Mosque",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: Colors.green),
            ),
          ),
        ),

      ),
      body: SingleChildScrollView(
        child: Column(children: [
          mainCard(context),
          Container(
            width: lebar,
            margin: const EdgeInsets.only(top: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                cardMenu("assets/images/dompet.png", "Persetujuan", (){Navigator.pushNamed(context, "/pengeluaran");},
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 18,
                    ),
                    color: Colors.green),
                cardMenu("assets/images/dompet.png", "Pengeluaran", (){Navigator.pushNamed(context, "/pengeluaran");},
                    icon: const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 18,
                    ),
                    color: Colors.red),
                cardMenu(
                  "assets/images/persetujuan.png",
                  "Persetujuan\nSaldo Kas", (){Navigator.pushNamed(context, "/pengeluaran");},
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 30),
            width: lebar,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Transaksi terakhir",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                GestureDetector(
                  child: const Text(
                    "Lihat semua",
                  ),
                  onTap: () {},
                )
              ],
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.only(top: 20),
              width: lebar,
              height: 50,
              child: cardDropDown(
                  const Icon(
                    Icons.arrow_forward,
                    size: 16,
                    color: Colors.white,
                  ),
                  "Pembangunan",
                  "09 April 2024",
                  "Rp 800.000"),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.only(top: 20),
              width: lebar,
              height: 50,
              child: cardDropDown(
                  const Icon(
                    Icons.arrow_forward,
                    size: 16,
                    color: Colors.white,
                  ),
                  "Pembangunan",
                  "09 April 2024",
                  "Rp 800.000"),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.only(top: 20),
              width: lebar,
              height: 50,
              child: cardDropDown(
                  const Icon(
                    Icons.arrow_forward,
                    size: 16,
                    color: Colors.white,
                  ),
                  "Pembangunan",
                  "09 April 2024",
                  "Rp 800.000"),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.only(top: 20),
              width: lebar,
              height: 50,
              child: cardDropDown(
                  const Icon(
                    Icons.arrow_forward,
                    size: 16,
                    color: Colors.white,
                  ),
                  "Pembangunan",
                  "09 April 2024",
                  "Rp 800.000"),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.only(top: 20),
              width: lebar,
              height: 50,
              child: cardDropDown(
                  const Icon(
                    Icons.arrow_forward,
                    size: 16,
                    color: Colors.white,
                  ),
                  "Pembangunan",
                  "09 April 2024",
                  "Rp 800.000"),
            ),
          ),
        ]),
      ),
    );
  }
}
