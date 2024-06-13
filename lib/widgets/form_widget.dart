import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FormWidget extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController controller;
  final onChanged;
  const FormWidget(
      {required this.title,
      required this.hint,
      required this.controller,
      this.onChanged,
      super.key});
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
          child: SizedBox(
            height: 55,
            width: MediaQuery.of(context).size.width * 0.86,
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                  hintText: hint,
                  border: const OutlineInputBorder(),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green))),
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }
}
