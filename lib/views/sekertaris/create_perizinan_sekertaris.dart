import 'package:emosque_mobile/models/models.dart';
import 'package:emosque_mobile/providers/providers.dart';
import 'package:emosque_mobile/views/sekertaris/dropdown_perizinanNama.dart';
import 'package:emosque_mobile/views/sekertaris/dropdown_perizinanPJ.dart';
import 'package:emosque_mobile/widgets/calender.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class CreatePerizinanSekertaris extends StatefulWidget {
  const CreatePerizinanSekertaris({super.key});

  @override
  State<CreatePerizinanSekertaris> createState() =>
      _CreatePerizinanSekertarisState();
}

class _CreatePerizinanSekertarisState extends State<CreatePerizinanSekertaris> {
  final TextEditingController _deskripsiController = TextEditingController();
  final TextEditingController _pengajuController = TextEditingController();

  String pj = 'PJ-1';
  String namaPerizinan = 'pernikahan';
  DateTime? selectedDate;

  void _handleDateSelection(DateTime date) {
    setState(() {
      selectedDate = date;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Perizinan',
          style: TextStyle(
              color: Colors.green, fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              SizedBox(height: 16),
              SizedBox(
                width: size.width * 0.9,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text("Nama Perizinan"),
                    const SizedBox(height: 5),
                    DropdownPerizinanNama(
                        initialValue: namaPerizinan,
                        onChanged: (newValue) {
                          setState(() {
                            namaPerizinan = newValue ?? 'pernikahan';
                          });
                        },
                        options: const [
                          'pernikahan',
                          'pengajian',
                          'penyuluhan'
                        ]),
                  ],
                ),
              ),
              SizedBox(height: 16),
              SizedBox(
                width: size.width * 0.9,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text("Deskripsi"),
                    const SizedBox(height: 5),
                    TextFormField(
                      controller: _deskripsiController,
                      decoration: const InputDecoration(
                        hintText: 'Masukkan deskripsi kegiatan',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Container(
                margin: EdgeInsets.only(bottom: 16),
                child: Calender(onDateSelected: _handleDateSelection),
              ),
              SizedBox(
                width: size.width * 0.9,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text("Nama Pengaju"),
                    const SizedBox(height: 5),
                    TextFormField(
                      controller: _pengajuController,
                      decoration: const InputDecoration(
                        hintText: 'Masukkan nama pengaju',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              DropdownPerizinanPJ(
                  initialValue: pj,
                  onChanged: (newValue) {
                    setState(() {
                      pj = newValue ?? 'PJ-1';
                    });
                  },
                  options: const ['PJ-1', 'PJ-2', 'PJ-3']),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      if (_deskripsiController.text.isEmpty ||
                          _pengajuController.text.isEmpty ||
                          selectedDate == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Data tidak boleh kosong"),
                          ),
                        );
                        return;
                      }
                      Navigator.pop(context);
                      int namaPerizinanToValue(String namaPerizinan) {
                        switch (namaPerizinan) {
                          case 'pernikahan':
                            return 1;
                          case 'pengajian':
                            return 2;
                          case 'penyuluhan':
                            return 3;
                          default:
                            return 0;
                        }
                      }

                      int pjToValue(String pj) {
                        switch (pj) {
                          case 'PJ-1':
                            return 1;
                          case 'PJ-2':
                            return 2;
                          case 'PJ-3':
                            return 3;
                          default:
                            return 0;
                        }
                      }

                      final formattedDate =
                          DateFormat('yyyy-MM-dd').format(selectedDate!);
                      final newPerizinan = Perizinan(
                        0,
                        _pengajuController.text,
                        formattedDate,
                        _deskripsiController.text,
                        namaPerizinanToValue(namaPerizinan),
                        pjToValue(pj),
                        '',
                        '',
                      );
                      final _perizinanProvider = Provider.of<PerizinanProvider>(
                          context,
                          listen: false);
                      _perizinanProvider.createPerizinan(newPerizinan).then(
                        (_) {
                          Navigator.pushNamed(
                              context, "/readPerizinanSekertaris");
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Perizinan berhasil dibuat'),
                            ),
                          );
                        },
                      ).catchError((error) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Gagal membuat perizinan'),
                          ),
                        );
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 5, top: 10),
                      width: 80,
                      height: 30,
                      decoration: BoxDecoration(
                          color: Colors.green[700],
                          borderRadius: BorderRadius.circular(7)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(
                                    width: 1.0,
                                    color: const Color(0xFFFFFFFF))),
                            child: Icon(
                              Icons.add,
                              size: 15,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Save',
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              )
            ],
          )
        ],
      ),
    );
  }
}
