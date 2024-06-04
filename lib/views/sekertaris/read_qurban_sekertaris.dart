import 'package:emosque_mobile/views/sekertaris/read_sapi.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:emosque_mobile/providers/providers.dart'; 

class ReadQurbanSekertaris extends StatefulWidget {
  const ReadQurbanSekertaris({super.key});

  @override
  _ReadQurbanSekertarisState createState() => _ReadQurbanSekertarisState();
}

class _ReadQurbanSekertarisState extends State<ReadQurbanSekertaris> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => Provider.of<QurbanProvider>(context, listen: false).getAllQurban());
  }

  Widget cardQurban( int id, String nama, String waktu, String jenis, BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ReadSapi(qurbanId: id),
          ),
        );
      },
      child: Container(
        height: 150,
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(color: Color.fromRGBO(172, 172, 172, 1), width: 0.7),
            bottom: BorderSide(color: Color.fromRGBO(172, 172, 172, 1), width: 0.7),
          ),
        ),
        child: Column(
          children: [
            ListTile(
              contentPadding: const EdgeInsets.only(left: 25, right: 25),
              title: Text(
                nama,
                style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              subtitle: Text(
                waktu,
                style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w400),
              ),
              trailing: Text(
                jenis,
                style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w400),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  height: 40,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.delete, color: Colors.white, size: 15),
                        const SizedBox(width: 5),
                        Text(
                          "Delete",
                          style: GoogleFonts.poppins(fontSize: 10, fontWeight: FontWeight.w400, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  height: 40,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(55, 163, 165, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/updateQurbanSekertaris');
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.update,
                          color: Colors.white,
                          size: 15,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          "Update",
                          style: GoogleFonts.poppins(fontSize: 10, fontWeight: FontWeight.w400, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          "Qurban",
          style: GoogleFonts.poppins(color: Colors.green, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Consumer<QurbanProvider>(
        builder: (context, qurbanProvider, child) {
          if (qurbanProvider.isLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (qurbanProvider.qurban.isEmpty) {
            return Center(child: Text('No data available.'));
          }

          return ListView.builder(
            itemCount: qurbanProvider.qurban.length,
            itemBuilder: (context, index) {
              final qurban = qurbanProvider.qurban[index];
              return cardQurban(
                qurban.idQurban,
                qurban.nama,
                qurban.tanggal,
                qurban.namaJenis,
                context,
              );
            },
          );
        },
      ),
    );
  }
}
