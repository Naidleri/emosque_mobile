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
          child: Text(
            'tanggal',
            textAlign: TextAlign.left,
          ),
        ),
        Container(
          width: size.width * 0.9,
          height: size.height * 0.5,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border:
                  Border.all(width: 2, color: Colors.black.withOpacity(0.3))),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(left: 30, right: 30, top: 10),
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
                    rangeHighlightColor: Color(0xff06d773).withOpacity(0.5),
                    selectedDecoration: BoxDecoration(
                      color: Color(0xff06d773),
                      shape: BoxShape.circle,
                    ),
                    todayDecoration: BoxDecoration(
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
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 7),
                        margin: EdgeInsets.only(left: 5, right: 5, top: 10),
                        width: 100,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(17),
                            border: Border.all(width: 1, color: Colors.black)),
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
                      Positioned(
                        top: -3,
                        left: 13,
                        child: Container(
                          padding: EdgeInsets.only(left: 3),
                          height: 20,
                          width: 40,
                          decoration: BoxDecoration(color: Colors.white),
                          child: Text('From'),
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 7),
                        margin: EdgeInsets.only(left: 5, right: 5, top: 10),
                        width: 100,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(17),
                            border: Border.all(width: 1, color: Colors.black)),
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
                      Positioned(
                        top: -3,
                        left: 13,
                        child: Container(
                          padding: EdgeInsets.only(left: 3),
                          height: 20,
                          width: 25,
                          decoration: BoxDecoration(color: Colors.white),
                          child: Text('To'),
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Container(
                      padding: EdgeInsets.only(top: 7),
                      margin: EdgeInsets.only(left: 5, right: 5, top: 10),
                      width: 100,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Color(0xff06d773),
                        borderRadius: BorderRadius.circular(17),
                      ),
                      child: Text(
                        'Set Data',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
