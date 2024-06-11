import 'package:emosque_mobile/models/models.dart';
import 'package:emosque_mobile/providers/providers.dart';
import 'package:emosque_mobile/views/sekertaris/dropdown_perizinanNama.dart';
import 'package:emosque_mobile/views/sekertaris/dropdown_perizinanPJ.dart';
import 'package:emosque_mobile/views/sekertaris/read_perizinan_sekertaris.dart';
import 'package:emosque_mobile/widgets/calender.dart';
import 'package:emosque_mobile/widgets/form_deskripsi_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:emosque_mobile/widgets/form_widget.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class UpdatePerizinanSekertaris extends StatefulWidget {
  const UpdatePerizinanSekertaris({super.key});

  @override
  State<UpdatePerizinanSekertaris> createState() =>
      _UpdatePerizinanSekertarisState();
}

class _UpdatePerizinanSekertarisState extends State<UpdatePerizinanSekertaris> {
  DateTime? selectedDate;

  void _handleDateSelection(DateTime date) {
    setState(() {
      selectedDate = date;
    });
  }

  late int idPerizinan;
  late int jenisPerizinan;
  late int pjId;
  late String deskripsiLama;
  late String namaPengajuLama;

  final namaKegiatan = TextEditingController();
  String namaPerizinan = 'pernikahan';
  String namaPerizinanLama = 'pernikahan';
  String pjLama = 'PJ-1';
  String pj = 'PJ-1';
  TextEditingController _deskripsiController = TextEditingController();
  TextEditingController _namaPengajuController = TextEditingController();

  @override
  void initState() {
    super.initState();
    deskripsiLama = '';
    namaPengajuLama = '';
    pjLama = '';
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    if (args != null) {
      setState(() {
        idPerizinan = args['idPerizinan'] ?? 0;
        deskripsiLama = args['deskripsi'] ?? '';
        namaPengajuLama = args['namaPengajuLama'] ?? '';
        if (args['namaPerizinan'] != null) {
          namaPerizinanLama = args['namaPerizinan'];
        }
        if (args['namaPj'] != null) {
          pjLama = args['namaPj'];
        }
      });
      if (_deskripsiController.text.isEmpty) {
        _deskripsiController.text = deskripsiLama;
      }
      if (_namaPengajuController.text.isEmpty) {
        _namaPengajuController.text = namaPengajuLama;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Update Perizinan',
          style: TextStyle(
              color: Colors.green, fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              SizedBox(
                width: size.width * 0.9,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text("Nama Perizinan"),
                    const SizedBox(height: 5),
                    DropdownPerizinanNama(
                      initialValue: namaPerizinanLama,
                      onChanged: (newValue) {
                        setState(() {
                          namaPerizinan = newValue ?? 'pernikahan';
                        });
                      },
                      options: const ['pernikahan', 'pengajian', 'penyuluhan'],
                    ),
                  ],
                ),
              ),
              FormDeskripsiWidget(
                title: 'Deskripsi',
                hint: 'Masukkan Deskripsi',
                controller: _deskripsiController,
              ),
              Calender(
                onDateSelected: _handleDateSelection,
              ),
              FormWidget(
                title: 'Nama Pengaju',
                hint: 'Masukkan Nama Pengaju',
                controller: _namaPengajuController,
              ),
              DropdownPerizinanPJ(
                initialValue: pj,
                onChanged: (newValue) {
                  setState(() {
                    pj = newValue ?? 'PJ-1';
                  });
                },
                options: const ['PJ-1', 'PJ-2', 'PJ-3'],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () async {
                      if (_deskripsiController.text.isEmpty ||
                          _namaPengajuController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Data tidak boleh kosong"),
                          ),
                        );
                        return;
                      }

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
                      final updatePerizinan = Perizinan(
                        0,
                        _namaPengajuController.text,
                        formattedDate,
                        _deskripsiController.text,
                        namaPerizinanToValue(namaPerizinan),
                        pjToValue(pj),
                        '',
                        '',
                      );
                      try {
                        final _perizinanProvider =
                            Provider.of<PerizinanProvider>(context,
                                listen: false);
                        await _perizinanProvider.updatePerizinan(
                            idPerizinan, updatePerizinan);
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ReadPerizinanSekertaris()),
                        );
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Error update perizinan: $e'),
                          ),
                        );
                      }
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: size.width * 0.1, top: 10),
                      width: 80,
                      height: 30,
                      decoration: BoxDecoration(
                        color: const Color(0xff37A3A5),
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.update,
                            size: 15,
                            color: Colors.white,
                          ),
                          Text(
                            'Update',
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
              ),
            ],
          )
        ],
      ),
    );
  }
}
