import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class CalenderPicker extends StatefulWidget {
  const CalenderPicker({super.key});

  @override
  State<CalenderPicker> createState() => _CalenderPickerState();
}

class _CalenderPickerState extends State<CalenderPicker> {
  DateTime? date1;
  DateTime? date2;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.only(left: 25),
          width: size.width * 1,
          child: const Text(
            'Tanggal',
            textAlign: TextAlign.left,
          ),
        ),
        Container(
          width: size.width * 0.9,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border:
                  Border.all(width: 2, color: Colors.black.withOpacity(0.3))),
          child: Column(
            children: [
              Container(
                margin:
                    EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
                decoration: BoxDecoration(),
                child: TableCalendar(
                  firstDay: DateTime.utc(2010, 10, 16),
                  lastDay: DateTime.utc(2030, 3, 14),
                  focusedDay: DateTime.now(),
                  rangeStartDay: date1,
                  rangeEndDay: date2,
                  selectedDayPredicate: (day) {
                    return date1 != null &&
                        date2 != null &&
                        day.isAfter(date1!) &&
                        day.isBefore(date2!.add(Duration(days: 1)));
                  },
                  calendarStyle: CalendarStyle(
                    rangeHighlightColor: Colors.green.withOpacity(0.5),
                    selectedDecoration: BoxDecoration(
                      color: Colors.green[700],
                      shape: BoxShape.circle,
                    ),
                    todayDecoration: const BoxDecoration(
                      color: Colors.transparent,
                    ),
                  ),
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      if (date1 == null) {
                        date1 = selectedDay;
                      } else if (date2 == null) {
                        date2 = selectedDay;
                      } else {
                        date1 = selectedDay;
                        date2 = null;
                      }
                    });
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 5),
                          width: 90,
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(17),
                              border:
                                  Border.all(width: 1, color: Colors.black)),
                          child: Center(
                            child: Text(
                              date1 != null
                                  ? DateFormat('yyyy-MM-dd').format(date1!)
                                  : '',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 3),
                          height: 20,
                          width: 40,
                          decoration: BoxDecoration(color: Colors.white),
                          child: Text('From'),
                        ),
                      ],
                    ),
                    Stack(
                      children: [
                        Container(
                          width: 90,
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(17),
                              border:
                                  Border.all(width: 1, color: Colors.black)),
                          child: Center(
                            child: Text(
                              date2 != null
                                  ? DateFormat('yyyy-MM-dd').format(date2!)
                                  : '',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 3),
                          height: 20,
                          width: 25,
                          decoration: BoxDecoration(color: Colors.white),
                          child: Text('To'),
                        ),
                      ],
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Container(
                        width: 100,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.green[700],
                          borderRadius: BorderRadius.circular(17),
                        ),
                        child: const Center(
                          child: Text(
                            'Set Data',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
