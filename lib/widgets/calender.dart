import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';

class calender extends StatefulWidget {
  const calender({
    super.key,
  });

  @override
  State<calender> createState() => _calenderState();
}

class _calenderState extends State<calender> {
  DateTime today = DateTime.now();
  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 10),
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
              borderRadius: BorderRadius.circular(7)),
          width: MediaQuery.of(context).size.width * 0.85,
          height: 350,
          child: TableCalendar(
            locale: "en_US",
            rowHeight: 43,
            headerStyle:
                HeaderStyle(formatButtonVisible: false, titleCentered: true),
            selectedDayPredicate: (day) => isSameDay(day, today),
            availableGestures: AvailableGestures.all,
            focusedDay: today,
            firstDay: DateTime.utc(2000, 01, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            onDaySelected: _onDaySelected,
          ),
        ),
      ],
    );
  }
}
