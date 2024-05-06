import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class fillButton extends StatelessWidget {
  final text;
  const fillButton({
    super.key,required this.text
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 309,
      height: 46,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.greenAccent[700],
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7))),
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