import 'package:emosque_mobile/widgets/calender.dart';
import 'package:flutter/material.dart';
// import 'package:table_calendar/table_calendar.dart';

class MyCalenderSeker extends StatefulWidget {
  const MyCalenderSeker({super.key});

  @override
  State<MyCalenderSeker> createState() => _MyCalenderSekerState();
}

class _MyCalenderSekerState extends State<MyCalenderSeker> {
  // CalendarFormat _calendarFormat = CalendarFormat.month;
  // DateTime _focusedDay = DateTime.now();
  // late DateTime _selectedDay = DateTime.now();
  //Tinggal menambahkan
  // Map<DateTime, List> _events = {
  //   DateTime.utc(2024, 5, 10): ['Hari Qurban'],
  //   DateTime.utc(2024, 5, 15): ['Hari Raya'],
  // };
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Kalender',
            style: TextStyle(
                color: Colors.green,
                fontSize: 25,
                fontWeight: FontWeight.bold),
          ),
        ),
        body: ListView(
          children: const [calender()],
        ),
      ),
    );
  }
}
