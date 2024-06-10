import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PickerDate extends StatefulWidget {
  const PickerDate({super.key});

  @override
  State<PickerDate> createState() => _PickerDateState();
}
class _PickerDateState extends State<PickerDate> {
  int pilihBulan = 1;
  int pilihTahun = 2024;

  final Map<int, String> _bulan = {
    1: "Januari",
    2: "Februari",
    3: "Maret",
    4: "April",
    5: "Mei",
    6: "Juni",
    7: "Juli",
    8: "Agustus",
    9: "September",
    10: "Oktober",
    11: "November",
    12: "Desember"
  };

  Widget filterTanggal(BuildContext context) {
    return Container(
      height: 60,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
          color: Colors.green[700], borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        onTap: () {
          _showPicker();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.date_range,
                  size: 26,
                  color: Colors.white,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 5),
                  child: Text(
                    "${_bulan[pilihBulan]} $pilihTahun",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: CircleAvatar(
                backgroundColor: Colors.green,
                radius: 16,
                child: Icon(
                  Icons.arrow_right,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _showPicker() {
    showCupertinoModalPopup(
      context: context,
      builder: (_) => Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 250, // Set your desired height
              child: CupertinoPicker(
                backgroundColor: Colors.green[700],
                itemExtent: 50,
                scrollController: FixedExtentScrollController(
                  initialItem: pilihBulan - 1,
                ),
                onSelectedItemChanged: (int value) {
                  setState(() {
                    pilihBulan = value + 1;
                  });
                },
                children: _bulan.values
                    .map((bulan) => Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                            bulan,
                            style: TextStyle(color: Colors.white),
                          ),
                    ))
                    .toList(),
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 250, // Set your desired height
              child: CupertinoPicker(
                backgroundColor: Colors.green[700],
                itemExtent: 50,
                scrollController: FixedExtentScrollController(
                  initialItem: pilihTahun - 2000,
                ),
                onSelectedItemChanged: (int value) {
                  setState(() {
                    pilihTahun = value;
                  });
                },
                children: _generateTahunItems(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _generateTahunItems() {
    List<Widget> tahunItems = [];
    for (int tahun = 2000; tahun <= 5000; tahun++) {
      tahunItems.add(Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(
          "$tahun",
          style: TextStyle(
            color: Colors.white,
          ), // Center text horizontally
        ),
      ));
    }
    return tahunItems;
  }

  @override
  Widget build(BuildContext context) {
    return filterTanggal(context);
  }
}
