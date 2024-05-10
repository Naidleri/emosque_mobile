import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DropdownQurban extends StatefulWidget {
  final String? initialValue;
  final ValueChanged<String?> onChanged;

  DropdownQurban({
    required this.initialValue,
    required this.onChanged,
  });

  @override
  _DropdownQurbanState createState() => _DropdownQurbanState();
}

class _DropdownQurbanState extends State<DropdownQurban> {
  String? jenis;
  List<String> jenisZakat = ['Sapi', 'Kambing'];

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
          Text(
            "Jenis Qurban",
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 12),
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Color.fromRGBO(6, 215, 115, 1),
            ),
            child: SizedBox(
              width: double.infinity,
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 16),
                    border: InputBorder.none,
                    hintText: 'Pilih Jenis Qurban',
                    hintStyle: GoogleFonts.poppins(
                      color: Colors.black,
                    ) // Set hint text here
                    ),
                icon: Icon(Icons.keyboard_arrow_down, color: Colors.black),
                dropdownColor: Color.fromRGBO(6, 215, 115, 1),
                value: jenis,
                onChanged: (String? newValue) {
                  setState(() {
                    jenis = newValue;
                  });
                  jenis = newValue;
                  widget.onChanged(newValue);
                },
                items: jenisZakat.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(
                            0), // Add padding to the dropdown item
                        child: Text(
                          value,
                          style: TextStyle (
                            color: Colors.black,
                          ),
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
