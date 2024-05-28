import 'package:emosque_mobile/views/auth/login.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RegisterPengurusPage extends StatelessWidget {
  const RegisterPengurusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Daftar untuk Pengurus",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: Color.fromARGB(255, 6, 215, 115)),
            ),
            const SizedBox(
            height: 40,
          ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Text("Nama"),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Masukkan nama',
                      hintText: 'Masukkan nama',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Text("Username"),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Masukkan username',
                      hintText: 'Masukkan username',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Text("Email"),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Masukkan email',
                      hintText: 'Masukkan email',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Text("Kunci pengurus"),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Masukkan kunci pengurus',
                      hintText: 'Masukkan kunci pengurus',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
            height: 50,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ));
                },
                style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.green),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(10.0), // Set corner radius
                  ),
                ),
              ),
                child: const Text(
                  'Daftar',
                  style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Text.rich(
              TextSpan(
                children: [
                  const TextSpan(text: "Sudah memiliki akun ? "),
                  TextSpan(
                      text: "Login",
                      style: const TextStyle(
                        color: Color.fromARGB(255, 6, 215, 115),
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()),
                          );
                        })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
