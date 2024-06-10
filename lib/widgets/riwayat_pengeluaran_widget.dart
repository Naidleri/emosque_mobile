import 'package:flutter/material.dart';
import 'package:emosque_mobile/utils/const.dart';


class RiwayatPengeluaranWidget extends StatelessWidget {
  final String title;
  final String amount;
  final String date;

  const RiwayatPengeluaranWidget({
    super.key,
    required this.title,
    required this.amount,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    date,
                    style: greyTextStyle.copyWith(
                      fontSize: 12, 
                    ),
                  ),
                ],
              ),
              Text(
                amount,
                style: blackTextStyle.copyWith(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,     
                ),
              ),
            ],
          ),
        ),
        Divider( 
          color:Color (0xffD6D6D6),
          thickness: 1.0,
          endIndent: 0,
          indent: 0,
        ),
      ],
    );
  }
}
