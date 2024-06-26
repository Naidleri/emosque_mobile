import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DropdownPerizinanPJ extends StatefulWidget {
  final String initialValue;
  final ValueChanged<String?> onChanged;
  final List<String> options;

  DropdownPerizinanPJ({
    required this.initialValue,
    required this.onChanged,
    required this.options,
  });

  @override
  _DropdownPerizinanPJState createState() => _DropdownPerizinanPJState();
}

class _DropdownPerizinanPJState extends State<DropdownPerizinanPJ> {
  late String jenis;

  @override
  void initState() {
    super.initState();
    jenis = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16, left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 12),
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.green[700],
            ),
            child: SizedBox(
              width: double.infinity,
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 16),
                    border: InputBorder.none,
                    hintText: 'Pilih penanggung jawab perizinan',
                    hintStyle:
                        GoogleFonts.poppins(color: Colors.black, fontSize: 14)),
                icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white),
                dropdownColor: Colors.green[700],
                value: jenis,
                onChanged: (String? newValue) {
                  setState(() {
                    jenis = newValue ?? widget.initialValue;
                  });
                  widget.onChanged(newValue);
                },
                items: widget.options
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: Text(
                        value,
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 14,
                            ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
