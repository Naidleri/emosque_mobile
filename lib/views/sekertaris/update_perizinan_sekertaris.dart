import 'package:emosque_mobile/widgets/textfieldDeskripsi.dart';
import 'package:flutter/material.dart';
import 'package:emosque_mobile/widgets/calender_picker_date.dart';
import 'package:emosque_mobile/widgets/form.dart';

class UpdatePerizinanSekertaris extends StatefulWidget {
  const UpdatePerizinanSekertaris({super.key});

  @override
  State<UpdatePerizinanSekertaris> createState() => _UpdatePerizinanSekertarisState();
}

class _UpdatePerizinanSekertarisState extends State<UpdatePerizinanSekertaris> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          
          centerTitle: true,
          title: const Text(
            'Perizinan',
            style: TextStyle(
                color: Colors.green,
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
                const TextfieldDeskripsi(
                    title: 'deskripsi', hint: 'Masukkan Deskripsi'),
                const CalenderPicker(),
                const form(title: 'Nama Pengaju', hint: 'Masukkan Nama Pengaju'),
                const form(
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
                            color: const Color(0xff37A3A5),
                            borderRadius: BorderRadius.circular(7)),
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
                )
              ],
            )
          ],
        ),
    );
  }
}
