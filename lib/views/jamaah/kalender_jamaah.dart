import 'package:emosque_mobile/models/models.dart';
import 'package:emosque_mobile/services/services.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'dart:collection';

class Event {
  final String date;
  final String name;

  Event(this.date, this.name);

  @override
  String toString() => name;
}

class KalenderJamaah extends StatefulWidget {
  const KalenderJamaah({super.key});

  @override
  State<KalenderJamaah> createState() => _MyKalenderJamaahState();
}

class _MyKalenderJamaahState extends State<KalenderJamaah> {
  late final ValueNotifier<List<Event>> _selectedEvents;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  int _selectedYear = DateTime.now().year;
  int _selectedMonth = DateTime.now().month;

  final LinkedHashMap<DateTime, List<Event>> _kEvents =
      LinkedHashMap<DateTime, List<Event>>(
    equals: isSameDay,
    hashCode: getHashCode,
  );

  bool _isLoading = false;
  final PerizinanService _perizinanService = PerizinanService();

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
    _fetchEvents();
  }

  Future<void> _fetchEvents() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final List<Perizinan> perizinanList =
          await _perizinanService.getAllPerizinan();
      setState(() {
        _kEvents.clear();
        for (var perizinan in perizinanList) {
          DateTime date = DateTime.parse(perizinan.tanggal);
          if (_kEvents[date] == null) {
            _kEvents[date] = [];
          }
          _kEvents[date]?.add(Event(perizinan.tanggal, perizinan.deskripsi));
        }
        _selectedEvents.value = _getEventsForDay(_selectedDay!);
      });
    } catch (e) {
      print('Error fetching events: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
  }

  List<Event> _getEventsForDay(DateTime day) {
    return _kEvents[day] ?? [];
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
      });

      _selectedEvents.value = _getEventsForDay(selectedDay);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Kalender',
          style: TextStyle(
            color: Colors.green[700],
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 7),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DropdownButton<int>(
                value: _selectedYear,
                items: List.generate(
                        50, (index) => DateTime.now().year - 25 + index)
                    .map<DropdownMenuItem<int>>((int value) {
                  return DropdownMenuItem<int>(
                    value: value,
                    child: Text(value.toString()),
                  );
                }).toList(),
                onChanged: (int? newValue) {
                  setState(() {
                    if (newValue != null) {
                      _selectedYear = newValue;
                      _focusedDay = DateTime(_selectedYear, _selectedMonth);
                    }
                  });
                },
              ),
              SizedBox(width: 20),
              DropdownButton<int>(
                value: _selectedMonth,
                items: List.generate(12, (index) => index + 1)
                    .map<DropdownMenuItem<int>>((int value) {
                  return DropdownMenuItem<int>(
                    value: value,
                    child: Text(value.toString()),
                  );
                }).toList(),
                onChanged: (int? newValue) {
                  setState(() {
                    if (newValue != null) {
                      _selectedMonth = newValue;
                      _focusedDay = DateTime(_selectedYear, _selectedMonth);
                    }
                  });
                },
              ),
            ],
          ),
          TableCalendar(
            locale: "en_US",
            rowHeight: 43,
            headerStyle: const HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
              titleTextStyle: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
              leftChevronIcon: Icon(
                Icons.chevron_left,
                color: Color.fromARGB(255, 179, 84, 84),
              ),
              rightChevronIcon: Icon(
                Icons.chevron_right,
                color: Colors.black,
              ),
            ),
            calendarStyle: CalendarStyle(
              markerMargin: EdgeInsets.symmetric(horizontal: 1.0),
              markerDecoration: BoxDecoration(
                color: Colors.green[700],
              ),
              markerSize: 5,
              isTodayHighlighted: true,
              todayDecoration: BoxDecoration(
                  shape: BoxShape.circle, color: Colors.green.shade300),
              selectedDecoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green.shade300,
              ),
              defaultTextStyle: const TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
              weekendTextStyle: const TextStyle(
                fontSize: 14,
                color: Colors.red,
              ),
              selectedTextStyle: const TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
              todayTextStyle: TextStyle(
                fontSize: 14,
                color: Colors.grey[800],
              ),
            ),
            firstDay: DateTime(DateTime.now().year - 10),
            lastDay: DateTime(DateTime.now().year + 10),
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            calendarFormat: _calendarFormat,
            eventLoader: _getEventsForDay,
            startingDayOfWeek: StartingDayOfWeek.monday,
            onDaySelected: _onDaySelected,
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
          ),
          const SizedBox(
            height: 30,
          ),
          Expanded(
            child: ValueListenableBuilder<List<Event>>(
              valueListenable: _selectedEvents,
              builder: (context, value, _) {
                if (value.isEmpty) {
                  return const Center(
                    child: Text(
                      'Tidak ada kegiatan',
                      style: TextStyle(fontSize: 20, color: Colors.grey),
                    ),
                  );
                }
                return ListView.builder(
                  itemCount: value.length,
                  itemBuilder: (context, index) {
                    return _buildEventItem(value[index]);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEventItem(Event event) {
    final dateTime = DateTime.parse(event.date);
    final formattedDate = DateFormat('dd').format(dateTime);
    return Container(
      height: 50,
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.green.shade700,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            formattedDate,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
          ),
          Text(
            event.name,
            style: const TextStyle(
                fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

final kToday = DateTime.now();
