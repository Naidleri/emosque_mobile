import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';

class calender extends StatelessWidget {
  const calender({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          margin: const EdgeInsets.only(left: 43),
          child: Text("Tanggal",
              style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.black)),
        ),
        const SizedBox(
          height: 7,
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey, // Warna border
              width: 2, // Lebar border
            ),
            borderRadius: BorderRadius.circular(7)
          ),
          width: 309,
          height: 415,
          child: TableCalendar(
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: DateTime.now()),
        ),
      ],
    );
  }
}
