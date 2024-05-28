import 'package:emosque_mobile/widgets/fillButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:badges/badges.dart' as badges;

class ProfileJamaah extends StatelessWidget {
  const ProfileJamaah({super.key});
  Widget text(String judul,String text, BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            judul,
            style: GoogleFonts.poppins(
                fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black),
          ),
          const SizedBox(height: 5),
          Container(
            decoration: BoxDecoration(border: Border.all(width: 2, color: Colors.green), borderRadius: BorderRadius.circular(10)),
            padding: const EdgeInsets.only(top: 16, left: 15),
            height: 60,
            width: MediaQuery.of(context).size.width * 0.85,
            child: Text(text, style: GoogleFonts.poppins(
                fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black),),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.greenAccent[700]),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20,),
            badges.Badge(
              badgeStyle: const badges.BadgeStyle(badgeColor: Colors.green),
              position: badges.BadgePosition.bottomStart(),
              badgeContent: IconButton(onPressed: () {}, icon: const Icon(Icons.edit, color: Colors.white,)),
              child: const CircleAvatar(radius: 60, 
                backgroundImage: NetworkImage('https://example.com/your-image-url.jpg'),),
            ),
            text('Nama', 'Ace Anugrah', context),
            text('Username', 'firdhaa.c', context),
            text('Email', 'firdhaac02@gmail.com', context),
            text('Role pengurus', 'Ketua Takmir', context),
            SizedBox(height: 20,),
            fillButton(text: 'Log out', onPressed: (){}),
          ],
        ),
      ),
    );
  }
}
