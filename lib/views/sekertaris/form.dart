import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class inputForm extends StatelessWidget {
  final String judul;
  final String hint;
  final TextEditingController? controller;
  final Widget? widget;

  const inputForm(
      {Key? key,
      required this.judul,
      required this.hint,
      this.controller,
      this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16, left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            judul,
            style:
                GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          Container(
            height: 52,
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.only(left: 12),
            decoration: BoxDecoration(
                border: Border.all(
                    color: Color.fromRGBO(172, 172, 172, 1), width: 0.7),
                borderRadius: BorderRadius.circular(8)),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    autofocus: false,
                    cursorColor: Color.fromRGBO(172, 172, 172, 1),
                    controller: controller,
                    style: GoogleFonts.poppins(
                        color: Color.fromRGBO(136, 136, 136, 1),
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                    decoration: InputDecoration(
                        hintText: hint,
                        hintStyle: GoogleFonts.poppins(
                            color: Color.fromRGBO(136, 136, 136, 1),
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                        focusedBorder:
                            UnderlineInputBorder(borderSide: BorderSide.none),
                        border:
                            UnderlineInputBorder(borderSide: BorderSide.none)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
