import 'package:emosque_mobile/widgets/calender_picker_date.dart';
import 'package:emosque_mobile/widgets/form.dart';
import 'package:emosque_mobile/widgets/textfieldDeskripsi.dart';
import 'package:flutter/material.dart';

class CreatePerizinanSekertaris extends StatefulWidget {
  const CreatePerizinanSekertaris({super.key});

  @override
  State<CreatePerizinanSekertaris> createState() =>
      _CreatePerizinanSekertarisState();
}

class _CreatePerizinanSekertarisState extends State<CreatePerizinanSekertaris> {
  final TextEditingController kegiatanController = TextEditingController();
  final TextEditingController perizinanController = TextEditingController();
  final TextEditingController deskripsiController = TextEditingController();
  final TextEditingController pengajuController = TextEditingController();
  final TextEditingController penanggungJawabController =
      TextEditingController();
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
              SizedBox(
                width: size.width * 0.9,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text("Nama Kegiatan"),
                    const SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      controller: kegiatanController,
                      decoration: const InputDecoration(
                        hintText: 'Masukkan nama kegiatan',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                      ),
                    ),
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
                    const Text("Nama Perizinan"),
                    const SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      controller: kegiatanController,
                      decoration: const InputDecoration(
                        hintText: 'Masukkan nama perizinan',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                      ),
                    ),
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
                    const SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      controller: kegiatanController,
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
                child: CalenderPicker(),
              ),
              SizedBox(
                width: size.width * 0.9,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text("Nama Pengaju"),
                    const SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      controller: kegiatanController,
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
              SizedBox(
                width: size.width * 0.9,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text("Nama Penanggung Jawab"),
                    const SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      controller: kegiatanController,
                      decoration: const InputDecoration(
                        hintText: 'Masukkan nama penanggung jawab',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Container(
                      margin: const EdgeInsets.only(right: 5, top: 10),
                      width: 80,
                      height: 30,
                      decoration: BoxDecoration(
                          color: Colors.green[700],
                          borderRadius: BorderRadius.circular(7)),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add,
                            size: 15,
                            color: Colors.white,
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
