import 'package:flutter/material.dart';

class MyHomepageSekertaris extends StatefulWidget {
  const MyHomepageSekertaris({super.key});

  @override
  State<MyHomepageSekertaris> createState() => _MyHomepageSekertarisState();
}

class _MyHomepageSekertarisState extends State<MyHomepageSekertaris> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text(
              'E-MOSque',
              style: TextStyle(
                  color: Color(0xff06d773),
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
          ),
          body: Column(
            children: [
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 27.5),
                    height: size.height * 0.2,
                    width: size.width * 0.9,
                    padding: EdgeInsets.only(left: 20, top: 30),
                    decoration: BoxDecoration(
                        color: Color(0xff06d773),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '20 hari lagi',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Hari Qurban',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 45,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 7.5,
                        ),
                        Text(
                          '20 march 2024',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                              context, '/createPerizinanSekertaris');
                        },
                        child: Column(
                          children: [
                            Container(
                              height: 75,
                              width: 75,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/icon-beranda-sekre-1.png'),
                                      fit: BoxFit.scaleDown),
                                  border: Border.all(
                                      width: 2.0, color: Color(0xffD9D9D9)),
                                  borderRadius: BorderRadius.circular(15)),
                            ),
                            Text(
                              'Perizinan',
                              style: TextStyle(color: Colors.black),
                            )
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                              context, '/addPenerimaZakatSekertaris');
                        },
                        child: Column(
                          children: [
                            Container(
                              height: 75,
                              width: 75,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/icon-beranda-sekre-2.png'),
                                      fit: BoxFit.scaleDown),
                                  border: Border.all(
                                      width: 2.0, color: Color(0xffD9D9D9)),
                                  borderRadius: BorderRadius.circular(15)),
                            ),
                            Text(
                              'Perizinan',
                              style: TextStyle(color: Colors.black),
                            )
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Column(
                          children: [
                            Container(
                              height: 75,
                              width: 75,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/icon-beranda-sekre-3.png'),
                                      fit: BoxFit.scaleDown),
                                  border: Border.all(
                                      width: 2.0, color: Color(0xffD9D9D9)),
                                  borderRadius: BorderRadius.circular(15)),
                            ),
                            Text(
                              'Perizinan',
                              style: TextStyle(color: Colors.black),
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          )),
    );
  }
}
