import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:emosque_mobile/providers/providers.dart';
import 'package:emosque_mobile/models/models.dart';

class QurbanJamaah extends StatefulWidget {
  const QurbanJamaah({super.key});

  @override
  State<QurbanJamaah> createState() => _QurbanJamaahState();
}

class _QurbanJamaahState extends State<QurbanJamaah> {
  @override
  void initState() {
    super.initState();
    _loadQurbanData();
  }

  void _loadQurbanData() {
    Future.microtask(() =>
        Provider.of<QurbanProvider>(context, listen: false).getAllQurban());
  }

  Widget cardQurban(Qurban qurban, BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        margin: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.green),
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.86,
              margin: const EdgeInsets.only(bottom: 8.0),
              child: Text(qurban.nama,
                  style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 8.0),
              child: Text(qurban.tanggal,
                  style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: Colors.black)),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 8.0),
              child: Text(qurban.deskripsi,
                  style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Colors.black)),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.86,
              margin: const EdgeInsets.only(bottom: 8.0),
              child: Image.network('https://pbm2024.site/public/${qurban.dokumentasi}'),
            ),
            Text(qurban.namaJenis,
                style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: Colors.black))
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Qurban",
          style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.green[700]),
        ),
      ),
      body: Consumer<QurbanProvider>(
        builder: (context, qurbanProvider, child) {
          if (qurbanProvider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (qurbanProvider.qurban.isEmpty) {
            return const Center(child: Text('No data available.'));
          }

          return ListView.builder(
            itemCount: qurbanProvider.qurban.length,
            itemBuilder: (context, index) {
              final qurban = qurbanProvider.qurban[index];
              return cardQurban(qurban, context);
            },
          );
        },
      ),
    );
  }
}

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => QurbanProvider()),
      ],
      child: const QurbanJamaah(),
    ),
  );
}
