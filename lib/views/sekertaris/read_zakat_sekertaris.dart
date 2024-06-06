import 'package:emosque_mobile/models/models.dart';
import 'package:emosque_mobile/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ReadZakatSekertaris extends StatefulWidget {
  const ReadZakatSekertaris({super.key});

  @override
  State<ReadZakatSekertaris> createState() => _ReadZakatSekertarisState();
}

class _ReadZakatSekertarisState extends State<ReadZakatSekertaris> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
        () => Provider.of<ZakatProvider>(context, listen: false).getAllZakat());
  }

  Widget cardZakat(Zakat zakat, BuildContext context) {
    return Container(
      height: 150,
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: Color.fromRGBO(172, 172, 172, 1), width: 0.7),
          bottom:
              BorderSide(color: Color.fromRGBO(172, 172, 172, 1), width: 0.7),
        ),
      ),
      child: Column(
        children: [
          ListTile(
            contentPadding: const EdgeInsets.only(left: 25, right: 25),
            title: Text(
              zakat.namaPezakat,
              style: GoogleFonts.poppins(
                  fontSize: 16, fontWeight: FontWeight.w500),
            ),
            subtitle: Text(
              zakat.namaJenisZakat,
              style: GoogleFonts.poppins(
                  fontSize: 12, fontWeight: FontWeight.w400),
            ),
            trailing: Text(
              '${zakat.jumlahZakat}',
              style: GoogleFonts.poppins(
                  fontSize: 16, fontWeight: FontWeight.w400),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                height: 40,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  onPressed: () {
                    Provider.of<ZakatProvider>(context, listen: false)
                        .deleteZakat(zakat.idZakat);
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Berhasil dihapus'),
                          content: const Text('Data zakat berhasil dihapus'),
                          actions: [
                            ElevatedButton(
                              child: const Text('OK'),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.delete, color: Colors.white, size: 15),
                      const SizedBox(width: 5),
                      Text(
                        "Delete",
                        style: GoogleFonts.poppins(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                height: 40,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(55, 163, 165, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/updateZakatSekertaris',
                      arguments: {
                        'namaPezakat': zakat.namaPezakat,
                        'jumlahZakat': zakat.jumlahZakat,
                        'namaJenisZakat': zakat.namaJenisZakat,
                      },
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.update,
                        color: Colors.white,
                        size: 15,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        "Update",
                        style: GoogleFonts.poppins(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          "Zakat",
          style: GoogleFonts.poppins(
              color: Colors.green[700],
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Consumer<ZakatProvider>(
        builder: (context, zakatProvider, child) {
          if (zakatProvider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (zakatProvider.zakatFitrah.isEmpty) {
            return const Center(child: Text('No data available.'));
          }
          return ListView.builder(
            itemCount: zakatProvider.zakatFitrah.length,
            itemBuilder: (context, index) {
              final zakat = zakatProvider.zakatFitrah[index];
              return cardZakat(zakat, context);
            },
          );
        },
      ),
      bottomSheet: Container(
        height: 50,
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            backgroundColor: Colors.green[700],
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/createZakatSekertaris');
          },
          child: const Center(
            child: Text(
              'Tambah Catatan',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
