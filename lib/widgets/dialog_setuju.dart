import 'package:flutter/material.dart';

class DialogSetuju extends StatelessWidget {
  final String title;
  final String totalSaldo;
  final String tanggal;

  const DialogSetuju({
    super.key,
    required this.title,
    required this.totalSaldo,
    required this.tanggal,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(7.0),
        side: const BorderSide(color: Color(0xFF225779), width: 1),
      ),
      title: Center(
        child: Text(
          title,
          style: const TextStyle(color: Color(0xFF225779), fontWeight: FontWeight.bold, fontSize: 13),
        )
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Total Saldo',
                style: TextStyle(color: Color(0xFF225779), fontWeight: FontWeight.bold, fontSize: 12),
              ),
              Text(
                totalSaldo,
                style: TextStyle(color: Colors.green[700], fontWeight: FontWeight.bold, fontSize: 12),
              ),
            ],
          ),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Tanggal',
                style: TextStyle(color: Color(0xFF225779), fontWeight: FontWeight.bold, fontSize: 12),),
              Text(
                tanggal,
                style: const TextStyle(color: Color(0xFF225779), fontSize: 12),
              ),
            ],
          ),
          const SizedBox(height: 20,),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green[700],
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24.0),
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 32
              )
            ),
            onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Kembali'),
          )
        ],
      ),
    );
  }
}
