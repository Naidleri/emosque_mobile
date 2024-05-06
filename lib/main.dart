// import 'package:emosque_mobile/views/persetujuanSaldoKas.dart';
import 'package:emosque_mobile/views/persetujuanSaldoKas.dart';
// import 'package:emosque_mobile/views/updatePersetujuanSaldoKas.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp ({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: persetujuanSaldoKas(),
    );
  }
}