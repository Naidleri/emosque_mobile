import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class fillButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const fillButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.85,
      height: 46,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green[700],
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(7))),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text,
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
