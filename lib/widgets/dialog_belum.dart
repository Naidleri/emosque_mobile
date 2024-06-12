import 'package:flutter/material.dart';

class DialogBelum extends StatelessWidget {
  final String title;
  final String catatan;
  final Function(String) setuju; // Updated to accept a String parameter
  final Function(String) tidakSetuju; // Updated to accept a String parameter

  const DialogBelum({
    Key? key,
    required this.title,
    required this.catatan,
    required this.setuju,
    required this.tidakSetuju,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final _catatanController = TextEditingController(text: catatan);

    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(7.0),
        side: const BorderSide(color: Color(0xFF225779), width: 1),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Setujui laporan keuangan ini?',
            style: TextStyle(
              color: Color(0xFF225779),
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.close,
              color: Color(0xFFF04438),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Text(
                title,
                style: TextStyle(
                  color: Color(0xFF225779),
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Catatan',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12.0,
                color: Color(0xFF225779),
              ),
            ),
            const SizedBox(height: 10.0),
            TextFormField(
              controller: _catatanController,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Masukkan catatan..',
                filled: true,
                fillColor: const Color(0xFFFFF0F0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7.0),
                  borderSide: const BorderSide(color: Color(0xFFF04438)),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Catatan tidak boleh kosong';
                }
                return null;
              },
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff06D773),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 32,
                    ),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      setuju(_catatanController.text); // Pass the catatan value
                      Navigator.of(context).pop();
                    }
                  },
                  child: Text('Setuju'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 32,
                    ),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      tidakSetuju(_catatanController.text); // Pass the catatan value
                      Navigator.of(context).pop();
                    }
                  },
                  child: Text('Tidak Setuju'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
