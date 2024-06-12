import 'package:emosque_mobile/models/models.dart';
import 'package:emosque_mobile/views/sekertaris/read_detail_penerima_qurban.dart';
import 'package:emosque_mobile/views/sekertaris/read_detail_penerima_zakat.dart';
import 'package:emosque_mobile/providers/providers.dart'; // Ensure the provider is imported
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ReadYayasanSekertaris extends StatefulWidget {
  const ReadYayasanSekertaris({super.key});

  @override
  State<ReadYayasanSekertaris> createState() => _ReadYayasanSekertarisState();
}

class _ReadYayasanSekertarisState extends State<ReadYayasanSekertaris>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this, initialIndex: 0);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<YayasanZProvider>(context, listen: false).getAllYayasan();
    });
  }

  Widget cardYayasan(YayasanZakat yayasan, VoidCallback onTap, BuildContext context) {
    return InkWell(
      onTap: onTap,
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
                yayasan.namaYayasan,
                style: GoogleFonts.poppins(
                    fontSize: 16, fontWeight: FontWeight.w500),
              ),
              subtitle: Text(
                yayasan.tanggal,
                style: GoogleFonts.poppins(
                    fontSize: 12, fontWeight: FontWeight.w400),
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
                    onPressed: () {
                      Provider.of<YayasanZProvider>(context, listen: false)
                              .deleteYayasan(yayasan.idYayasanZakat)
                              .then((_) {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text('Berhasil dihapus'),
                                  content: const Text(
                                      'Data yayasan penerima berhasil dihapus'),
                                  actions: [
                                    ElevatedButton(
                                      child: const Text('OK'),
                                      onPressed: () {
                                        Navigator.pop(context);

                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          }).catchError((error) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('data yayasan penerima gagal dihapus'),
                            ));
                          });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.delete, color: Colors.white, size: 15),
                        const SizedBox(width: 5),
                        Text(
                          "Delete",
                          style: GoogleFonts.poppins(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
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
                      Navigator.pushNamed(
                          context, '/updatePenerimaZakatSekertaris');
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
                          style: GoogleFonts.poppins(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
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
          "Yayasan",
          style: GoogleFonts.poppins(
              color: Colors.green[700],
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.green[700],
          indicatorColor: Colors.green[700],
          tabs: const [
            Tab(text: 'Zakat'),
            Tab(text: 'Qurban'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Consumer<YayasanZProvider>(
              builder: (context, provider, child) {
                if (provider.isLoading) {
                  return Center(child: CircularProgressIndicator());
                }
                if (provider.yayasanZakat.isEmpty) {
                  return Center(child: Text('No data available.'));
                }
                return ListView.builder(
                  itemCount: provider.yayasanZakat.length,
                  itemBuilder: (context, index) {
                    final yayasan = provider.yayasanZakat[index];
                    return cardYayasan(yayasan, () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ReadDetailPenerimaZakat(yayasanZakat: yayasan),
                          
                        ),
                      );
                    }, context);
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                cardYayasan(
                  YayasanZakat(0, 'Agus', '10 Des 2020', 0, 11, ''),
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ReadDetailPenerimaQurban(),
                      ),
                    );
                  },
                  context,
                ),
                cardYayasan(
                  YayasanZakat(0, 'Agus', '10 Des 2020', 0, 11, ''),
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ReadDetailPenerimaQurban(),
                      ),
                    );
                  },
                  context,
                ),
              ],
            ),
          ),
        ],
      ),
      bottomSheet: Container(
        height: 50,
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5)),
            backgroundColor: Colors.green[700],
          ),
          onPressed: () {
            if (_tabController.index == 0) {
              Navigator.pushNamed(context, '/createPenerimaZakatSekertaris');
            } else {
              Navigator.pushNamed(context, '/createPenerimaQurbanSekertaris');
            }
          },
          child: const Center(
            child: Text(
              'Tambah Penerima',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
