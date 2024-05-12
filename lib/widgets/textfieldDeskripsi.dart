import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextfieldDeskripsi extends StatelessWidget {
  final String title;
  final String hint;

  const TextfieldDeskripsi(
      {required this.title, required this.hint, super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
            height: 150,
            width: size.width * 0.77,
            child: TextFormField(
              maxLines:
                  null, // Mengatur null agar TextField bisa tumbuh sesuai kebutuhan
              minLines: 3,
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black.withOpacity(0.16)),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff06D773)),
                  borderRadius: BorderRadius.circular(10),
                ),
                hintStyle: TextStyle(color: Colors.grey),
                hintText: hint,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
