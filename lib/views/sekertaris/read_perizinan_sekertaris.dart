import 'package:emosque_mobile/models/models.dart';
import 'package:emosque_mobile/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ReadPerizinanSekertaris extends StatefulWidget {
  const ReadPerizinanSekertaris({super.key});

  @override
  State<ReadPerizinanSekertaris> createState() =>
      _ReadPerizinanSekertarisState();
}

class _ReadPerizinanSekertarisState extends State<ReadPerizinanSekertaris> {
  @override
  void initState() {
    super.initState();
    _loadPerizinanData();
  }

  void _loadPerizinanData() {
    Future.microtask(() =>
        Provider.of<PerizinanProvider>(context, listen: false)
            .getAllPerizinan());
  }

  Widget cardPerizinan(Perizinan perizinan, BuildContext context) {
    return Container(
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
              perizinan.namaPengaju,
              style: GoogleFonts.poppins(
                  fontSize: 16, fontWeight: FontWeight.w500),
            ),
            subtitle: Text(
              '${perizinan.deskripsi}\n${perizinan.tanggal}',
              style: GoogleFonts.poppins(
                  fontSize: 12, fontWeight: FontWeight.w400),
            ),
            trailing: Text(
              perizinan.namaPerizinan,
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
                    Provider.of<PerizinanProvider>(context, listen: false)
                        .deletePerizinan(perizinan.idDetailPerizinan)
                        .then((_) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Berhasil dihapus'),
                            content:
                                const Text('Data perizinan berhasil dihapus'),
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
                    }).catchError((error) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('data perizinan gagal dihapus'),
                      ));
                    });
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
                      '/updatePerizinanSekertaris',
                      arguments: {
                        'idPerizinan': perizinan.idDetailPerizinan,
                        'namaPerizinan': perizinan.namaPerizinan,
                        'jenisPerizinan': perizinan.perizinanId,
                        'deskripsi': perizinan.deskripsi,
                        'namaPengajuLama': perizinan.namaPengaju,
                        'pjId': perizinan.pjId,
                        'tanggal': perizinan.tanggal,
                        'namaPj': perizinan.namaPJ,
                      },
                    ).then((result) {
                      if (result == true) {
                        _loadPerizinanData();
                      }
                    });
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
          "Perizinan",
          style: GoogleFonts.poppins(
              color: Colors.green[700],
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Consumer<PerizinanProvider>(
        builder: (context, perizinanProvider, child) {
          if (perizinanProvider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (perizinanProvider.perizinan.isEmpty) {
            return const Center(child: Text('No data available.'));
          }

          return ListView.builder(
            padding: EdgeInsets.only(bottom: 100),
            itemCount: perizinanProvider.perizinan.length,
            itemBuilder: (context, index) {
              final perizinan = perizinanProvider.perizinan[index];
              return cardPerizinan(perizinan, context);
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
            Navigator.pushNamed(context, '/createPerizinanSekertaris');
          },
          child: const Center(
            child: Text(
              'Tambah Perizinan',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
