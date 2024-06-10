import 'package:flutter/material.dart';

class DialogBelum extends StatelessWidget {
  final String title;
  final String catatan;

  const DialogBelum({
    super.key,
    required this.title,
    required this.catatan,
  });

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
          const Text(
            'Pembatalan',
            style: TextStyle(color: Color(0xFF225779), fontWeight: FontWeight.bold, fontSize: 13),
          ),
          IconButton(
            icon: const Icon(
              Icons.close,
              color: Color(0xFFF04438), // Warna ikon
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
                style: const TextStyle(color: Color(0xFF225779), fontWeight: FontWeight.bold, fontSize: 13),
              ),
            ),
            const SizedBox(height: 20,),
            const Text(
              'Catatan',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12.0,
                color: Color(0xFF225779)
              ),
            ),
            const SizedBox(height: 10.0),
            TextFormField(
              controller: _catatanController,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Masukan catatan..',
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
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 32,
                    ),
                    foregroundColor: const Color(0xFF225779),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                    side: const BorderSide(
                      color: Color(0xFF225779),
                    )
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Batal'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[700],
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 32
                    )
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.of(context).pop();
                    }
                  },
                  child: const Text('Kirim'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
