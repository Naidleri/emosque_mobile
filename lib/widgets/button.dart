import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Button extends StatelessWidget {
  final text;
  const Button({
    super.key,required this.text
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.greenAccent,
          width: 2
        ),
        borderRadius: BorderRadius.circular(5)
      ),
      width: 309,
      height: 46,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7))),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text,
              style: GoogleFonts.poppins(
                  color: Colors.green[700],
                  fontWeight: FontWeight.w500,
                  fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}