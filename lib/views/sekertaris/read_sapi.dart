import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:emosque_mobile/providers/providers.dart'; 

class ReadSapi extends StatefulWidget {
  final int qurbanId;

  const ReadSapi({required this.qurbanId, Key? key}) : super(key: key);
  @override
  State<ReadSapi> createState() => _ReadSapiState();
}

class _ReadSapiState extends State<ReadSapi> {
  @override
  void initState(){
    super.initState();
    Provider.of<QurbanProvider>(context, listen: false).getQurbanById(widget.qurbanId);
  }
  Widget build(BuildContext context) {
    final _qurbanProvider =  Provider.of<QurbanProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          padding: const EdgeInsets.only(left: 20),
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 25,
          ),
        ),
        title: Text(
          "Qurban",
          style: GoogleFonts.poppins(
              color: const Color.fromRGBO(6, 215, 115, 1),
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(border: Border(top: BorderSide())),
              child: ListTile(
                contentPadding: const EdgeInsets.only(top: 12, left: 25, right: 25),
                title: Text(
                  _qurbanProvider.qurban[0].nama,
                  style: GoogleFonts.poppins(
                      fontSize: 20, fontWeight: FontWeight.w500),
                ),
                subtitle: Text(
                  _qurbanProvider.qurban[0].deskripsi,
                  style: GoogleFonts.poppins(
                      fontSize: 17, fontWeight: FontWeight.w400),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Column(
              children: [
                Container(
                  child: ListTile(
                    contentPadding:
                        const EdgeInsets.only(top: 12, left: 25, right: 25),
                    title: Text(
                      "Sapi",
                      style: GoogleFonts.poppins(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                Image.asset(
                  'images/${_qurbanProvider.qurban[0].dokumentasi}',
                  width: 150,
                  height: 100,
                  fit: BoxFit.cover,
                  alignment: Alignment.topLeft,
                ),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(padding: EdgeInsets.symmetric(horizontal: 50)),
                SizedBox(
                  width: 120,
                  height: 30,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5))),
                      onPressed: () {},
                      child: const Row(
                        children: [
                          Icon(Icons.delete, color: Colors.white, size: 17),
                          SizedBox(width: 10),
                          Text(
                            "Delete",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      )),
                ),
                const SizedBox(width: 5),
                SizedBox(
                  width: 120,
                  height: 30,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(55, 163, 165, 1),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5))),
                      onPressed: () {
                        // Navigator.push(context, MaterialPageRoute(
                        // builder: (context) => updateZakat(),
                        // ));
                      },
                      child: const Row(
                        children: [
                          Icon(
                            Icons.update,
                            color: Colors.white,
                            size: 17,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Update",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
