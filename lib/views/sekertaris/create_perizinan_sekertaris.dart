import 'package:emosque_mobile/widgets/calender_picker_date.dart';
import 'package:emosque_mobile/widgets/form.dart';
import 'package:emosque_mobile/widgets/textfieldDeskripsi.dart';
import 'package:flutter/material.dart';

class CreatePerizinanSekertaris extends StatefulWidget {
  const CreatePerizinanSekertaris({super.key});

  @override
  State<CreatePerizinanSekertaris> createState() => _CreatePerizinanSekertarisState();
}

class _CreatePerizinanSekertarisState extends State<CreatePerizinanSekertaris> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Perizinan',
            style: TextStyle(
                color: Color(0xff06d773),
                fontSize: 25,
                fontWeight: FontWeight.bold),
          ),
        ),
        body: ListView(
          children: [
            Column(
              children: [
                const form(title: 'Nama Kegiatan', hint: 'Masukkan Nama Kegiatan'),
                const form(title: 'Nama Perizinan', hint: 'Masukkan Nama Perizinan'),
                TextfieldDeskripsi(
                    title: 'deskripsi', hint: 'Masukkan Deskripsi'),
                CalenderPicker(),
                form(title: 'Nama Pengaju', hint: 'Masukkan Nama Pengaju'),
                form(
                    title: 'Nama Penanggung Jawab',
                    hint: 'Masukkan Nama Penanggung Jawab'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Container(
                        margin:
                            EdgeInsets.only(right: size.width * 0.1, top: 10),
                        width: 80,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Color(0xff06d773),
                            borderRadius: BorderRadius.circular(7)),
                        child: Row(
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
                SizedBox(
                  height: 50,
                )
              ],
            )
          ],
        ),
    );
  }
}
