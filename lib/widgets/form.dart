import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class form extends StatelessWidget {
  final String title;
  final String hint;

  const form({required this.title, required this.hint, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            margin: const EdgeInsets.only(left: 43, bottom: 7, top: 7),
            child: Text(title,
                style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.black))),
        Center(
          child: Container(
            height: 55,
            width: 309,
            child: TextField(
              decoration: InputDecoration(
                hintText: hint,
                border:  const OutlineInputBorder(),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.greenAccent)
                )
              ),
            ),
          ),
        ),
      ],
    );
  }
}