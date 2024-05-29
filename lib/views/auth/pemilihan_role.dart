import 'package:emosque_mobile/views/auth/register_jamaah.dart';
import 'package:emosque_mobile/views/auth/register_pengurus.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PemilihanRole extends StatelessWidget {
  const PemilihanRole({super.key});
  Widget button(VoidCallback onPressed, String text, Color backgroundButton,
      Color colorText, BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.86,
      height: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10)),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(backgroundButton),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0), // Set corner radius
            ),
          ),
        ),
        child: Text(
          text,
          style: GoogleFonts.poppins(
              fontSize: 16, fontWeight: FontWeight.w700, color: colorText),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center, children: [
        const Text(
              'Daftar Sebagai',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins'),
            ),
            const SizedBox(
              height: 30,
            ),
            button(() {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const RegisterPengurusPage()));
            }, 'Pengelola Masjid', Colors.white, Colors.green, context),
            const SizedBox(
              height: 10,
            ),
            button(() {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const RegisterJamaahPage()));
            }, 'Jamaah', Colors.white, Colors.green, context)
      ],),),
    );
  }
}