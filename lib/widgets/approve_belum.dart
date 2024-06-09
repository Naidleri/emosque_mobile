import 'package:emosque_mobile/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ApproveBelum extends StatefulWidget {
  final String judul;
  final int nominal;
  final String date;

  const ApproveBelum({
    Key? key,
    required this.judul,
    required this.nominal,
    required this.date,
  }) : super(key: key);

  @override
  State<ApproveBelum> createState() => _ApproveBelumState();
}

class _ApproveBelumState extends State<ApproveBelum> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Color(0xFFF7F7F7),
        border: Border.all(color: Color(0xff225779), width: 1.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.judul,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF225779),
                ),
              ),
              Text(
                widget.date,
                style: TextStyle(
                  fontSize: 14.0,
                  color: Color(0xFF225779),
                ),
              ),
            ],
          ),
          Text(
            widget.nominal.toString(),
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Color(0xFF225779),
            ),
          ),
        ],
      ),
    );
  }
}
