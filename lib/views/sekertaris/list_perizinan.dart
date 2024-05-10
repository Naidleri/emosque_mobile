import 'package:flutter/material.dart';

class MyListPerizinan extends StatefulWidget {
  const MyListPerizinan({super.key});

  @override
  State<MyListPerizinan> createState() => _MyListPerizinanState();
}

class _MyListPerizinanState extends State<MyListPerizinan> {
  String a = 'pernikahan agus dengan dea adalah hal yang membahagiakan';
  String b =
      'bang agus menikah dengan dea adalah hal yang membahagiakan serta menarik untuk di datangi';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading:
              IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
          centerTitle: true,
          title: Text(
            'Perizinan',
            style: TextStyle(
                color: Color(0xff06d773),
                fontSize: 25,
                fontWeight: FontWeight.bold),
          ),
        ),
        body: ListView(
          children: [
            Column(
              children: [
                //looping di sini
                Container(
                    height: 115,
                    width: size.width * 1,
                    child: Column(
                      children: [
                        Divider(
                          color: Color(0xffD6D6D6),
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 30),
                              width: 200,
                              height: 90,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    a.length > 15
                                        ? a.substring(0, 15) + '...'
                                        : a,
                                    style: TextStyle(fontSize: 17),
                                  ),
                                  Text(
                                    b.length > 17
                                        ? b.substring(0, 20) + '...'
                                        : b,
                                    style: TextStyle(fontSize: 13),
                                  ),
                                  Text(
                                    '22 january 2024',
                                    style: TextStyle(
                                        fontSize: 10,
                                        color:
                                            Color(0xff225779).withOpacity(0.6)),
                                  )
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    width: 150,
                                    child: Column(
                                      children: [
                                        Text(
                                          'Pernikahan',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    )),
                                SizedBox(
                                  height: 30,
                                ),
                                Container(
                                  width: 150,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      TextButton(
                                        onPressed: () {},
                                        child: Container(
                                          width: 50,
                                          height: 15,
                                          decoration: BoxDecoration(
                                              color: Color(0xffD70606),
                                              borderRadius:
                                                  BorderRadius.circular(3)),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.delete_outline,
                                                size: 9,
                                                color: Colors.white,
                                              ),
                                              Text(
                                                'Delete',
                                                style: TextStyle(
                                                    fontSize: 9,
                                                    color: Colors.white),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {},
                                        child: Container(
                                          width: 50,
                                          height: 15,
                                          decoration: BoxDecoration(
                                              color: Color(0xff37A3A5),
                                              borderRadius:
                                                  BorderRadius.circular(3)),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.update,
                                                size: 9,
                                                color: Colors.white,
                                              ),
                                              Text(
                                                'Update',
                                                style: TextStyle(
                                                    fontSize: 9,
                                                    color: Colors.white),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
