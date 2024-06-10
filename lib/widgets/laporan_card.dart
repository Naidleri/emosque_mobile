import 'package:flutter/material.dart';

class LaporanCard extends StatelessWidget {
  final String title;
  final String amount;
  final String date;

  const LaporanCard({
    super.key,
    required this.title,
    required this.amount,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: const Color(0xFFF7F7F7), 
        border: Border.all(color: const Color(0xFF225779), width: 1.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF225779),
                ),
              ),
              Text(
                date,
                style: const TextStyle(
                  fontSize: 14.0,
                  color: Color(0xFF225779),
                ),
              ),
            ],
          ),
          Text(
            amount,
            style: const TextStyle(
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
