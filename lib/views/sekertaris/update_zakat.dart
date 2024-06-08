import 'package:emosque_mobile/models/models.dart';
import 'package:emosque_mobile/providers/providers.dart';
import 'package:emosque_mobile/views/sekertaris/dropdown_zakat.dart';
import 'package:emosque_mobile/views/sekertaris/input_form.dart';
import 'package:emosque_mobile/views/sekertaris/read_zakat_sekertaris.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UpdateZakatSekertaris extends StatefulWidget {
  const UpdateZakatSekertaris({super.key});

  @override
  State<UpdateZakatSekertaris> createState() => _UpdateZakatSekertarisState();
}

class _UpdateZakatSekertarisState extends State<UpdateZakatSekertaris> {
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _jumlahController = TextEditingController();
  String jenis = 'Beras';
  String jenisLama = 'Beras';
  late String namaPezakat;
  late int jumlahZakat;
  late int idZakat;

  @override
  void initState() {
    super.initState();
    namaPezakat = '';
    jumlahZakat = 0;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    if (args != null) {
      setState(() {
        idZakat = args['idZakat'] ?? 0;
        namaPezakat = args['namaPezakat'] ?? '';
        jumlahZakat = args['jumlahZakat'] ?? 0;
        if (args['namaJenisZakat'] != null) {
          jenisLama = args['namaJenisZakat'];
        }
      });
      _namaController.text = namaPezakat;
      _jumlahController.text = jumlahZakat.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Zakat Fitrah",
          style: GoogleFonts.poppins(
            color: Colors.green[700],
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text('Nama Pezakat'),
                  const SizedBox(height: 3),
                  TextFormField(
                    controller: _namaController,
                    decoration: const InputDecoration(
                      hintText: 'Masukkan nama pezakat',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                    ),
                    onChanged: (value) {
                      namaPezakat = value;
                    },
                  ),
                  const SizedBox(height: 10),
                  const Text('Jumlah Zakat'),
                  const SizedBox(height: 3),
                  TextFormField(
                    controller: _jumlahController,
                    decoration: const InputDecoration(
                      hintText: 'Masukkan jumlah zakat',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      jumlahZakat = int.tryParse(value) ?? 0;
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            DropdownZakat(
              initialValue: jenisLama,
              onChanged: (newValue) {
                setState(() {
                  jenis = newValue ?? 'Beras';
                });
              },
              options: const ['Beras', 'Uang Tunai'],
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Container(
        height: 40,
        width: 125,
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            backgroundColor: const Color.fromRGBO(55, 163, 165, 1),
          ),
          onPressed: () {
            if (_namaController.text.isEmpty ||
                _jumlahController.text.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Data tidak boleh kosong"),
                ),
              );
              return;
            }

            int jenisToValue(String jenis) {
              switch (jenis) {
                case 'Beras':
                  return 1;
                case 'Uang Tunai':
                  return 2;
                default:
                  return 0;
              }
            }

            final updateZakat = CreateZakat(
                nama: _namaController.text,
                jumlah: int.parse(_jumlahController.text),
                jenis: jenisToValue(jenis));
            final _zakatProvider =
                Provider.of<ZakatProvider>(context, listen: false);
            _zakatProvider.updateZakat(idZakat, updateZakat).then((_) =>
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ReadZakatSekertaris())));
          },
          child: const Center(
            child: Row(
              children: [
                Icon(
                  Icons.update,
                  color: Colors.white,
                  size: 17,
                ),
                SizedBox(width: 10),
                Text(
                  'Update',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
