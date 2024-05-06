import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class formDeskripsi extends StatelessWidget {
  final title;
  final hint;
  const formDeskripsi({super.key, required this.title, required this.hint});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            margin: const EdgeInsets.only(bottom: 7, top: 7),
            child: Text(title,
                style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.black))),
        SizedBox(
          height: 73,
          width: 309,
          child: TextField(
            decoration: InputDecoration(
                hintText: hint,
                border: const OutlineInputBorder(),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.greenAccent))),
          ),
        ),
      ],
    );
  }
}
