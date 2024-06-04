import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';

class KalenderJamaah extends StatefulWidget {
  const KalenderJamaah({super.key});
  @override
  State<KalenderJamaah> createState() => _MyKalenderJamaahState();
}

class _MyKalenderJamaahState extends State<KalenderJamaah> {
  Widget event(String tanggal, String nama) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(right: 8),
          child: Text(
            tanggal,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.80,
          child: Container(
            padding: const EdgeInsets.only(top: 7, bottom: 8, left: 30),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: const Color.fromARGB(255, 55, 163, 165)),
            child: Text(
              nama,
              style: GoogleFonts.poppins(fontSize: 14, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Kalender',
            style: TextStyle(
                color: Colors.green, fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        body: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 7,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  width: MediaQuery.of(context).size.width * 0.85,
                  height: 350,
                  child: TableCalendar(
                    locale: "en_US",
                    rowHeight: 43,
                    headerStyle: HeaderStyle(
                      formatButtonVisible: false,
                      titleCentered: true,
                      titleTextStyle: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                      leftChevronIcon: const Icon(
                        Icons.chevron_left,
                        color: Colors.black,
                      ),
                      rightChevronIcon: const Icon(
                        Icons.chevron_right,
                        color: Colors.black,
                      ),
                    ),
                    calendarStyle: CalendarStyle(
                      defaultTextStyle: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                      weekendTextStyle: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.red,
                      ),
                      selectedTextStyle: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                      todayTextStyle: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.blue,
                      ),
                    ),
                    selectedDayPredicate: (day) =>
                        isSameDay(day, DateTime.now()),
                    availableGestures: AvailableGestures.all,
                    focusedDay: DateTime.now(),
                    firstDay: DateTime.utc(2000, 01, 16),
                    lastDay: DateTime.utc(2030, 3, 14),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 15),
                  child: Column(
                    children: [
                      event('20', "Hari Raya Idul Adha")
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
    );
  }
}
