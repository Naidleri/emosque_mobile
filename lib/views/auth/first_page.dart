import 'package:emosque_mobile/views/auth/login.dart';
import 'package:emosque_mobile/views/auth/pemilihan_role.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  Widget button(VoidCallback onPressed, String text, Color backgroundButton,
      Color colorText, BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.86,
      height: 60,
      decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Colors.green,
          ),
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
      backgroundColor: Colors.green[700],
      bottomSheet: Container(
        height: 300,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30,
            ),
            Text(
              'Selamat Datang',
              style: TextStyle(
                  color: Colors.green[700],
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins'),
            ),
             Text(
              'E-Mosque',
              style: TextStyle(
                  color: Colors.green[700],
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins'),
            ),
            const SizedBox(
              height: 30,
            ),
            button(() {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const LoginPage()));
            }, 'Masuk', Colors.green, Colors.white, context),
            const SizedBox(
              height: 10,
            ),
            button(() {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const PemilihanRole()));
            }, 'Daftar', Colors.white, Colors.green, context)
          ],
        ),
      ),
    );
  }
}
