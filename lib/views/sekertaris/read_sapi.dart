import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class readSapi extends StatefulWidget {
  @override
  State<readSapi> createState() => _readSapiState();
}

class _readSapiState extends State<readSapi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          padding: EdgeInsets.only(left: 20),
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back_ios,
            size: 25,
          ),
        ),
        title: Text(
          "Qurban",
          style: GoogleFonts.poppins(
              color: Color.fromRGBO(6, 215, 115, 1),
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(border: Border(top: BorderSide())),
              child: ListTile(
                contentPadding: EdgeInsets.only(top: 12, left: 25, right: 25),
                title: Text(
                  "Agus Subagio",
                  style: GoogleFonts.poppins(
                      fontSize: 20, fontWeight: FontWeight.w500),
                ),
                subtitle: Text(
                  "Sapi ini memiliki daging yang empuk dan lembut tidak ada yang bisa menandinginya",
                  style: GoogleFonts.poppins(
                      fontSize: 17, fontWeight: FontWeight.w400),
                ),
              ),
            ),
            SizedBox(height: 5),
            Column(
              children: [
                Container(
                  child: ListTile(
                    contentPadding:
                        EdgeInsets.only(top: 12, left: 25, right: 25),
                    title: Text(
                      "Sapi",
                      style: GoogleFonts.poppins(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                Image.asset(
                  'images/sapi.webp',
                  width: 150,
                  height: 100,
                  fit: BoxFit.cover,
                  alignment: Alignment.topLeft,
                ),
              ],
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(padding: EdgeInsets.symmetric(horizontal: 50)),
                SizedBox(
                  width: 120,
                  height: 30,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5))),
                      onPressed: () {},
                      child: Row(
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
                SizedBox(width: 5),
                SizedBox(
                  width: 120,
                  height: 30,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(55, 163, 165, 1),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5))),
                      onPressed: () {
                        // Navigator.push(context, MaterialPageRoute(
                        // builder: (context) => updateZakat(),
                        // ));
                      },
                      child: Row(
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
