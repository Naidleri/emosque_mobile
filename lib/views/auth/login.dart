import 'package:emosque_mobile/models/models.dart';
import 'package:emosque_mobile/providers/providers.dart';
import 'package:emosque_mobile/views/auth/pemilihan_role.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        margin: EdgeInsets.only(top: height * 0.15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Masuk",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: Colors.green[700]),
            ),
            Image.asset(
              "assets/images/logo.png",
              scale: 5,
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Text(
                    "Username",
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: TextField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      hintText: 'Masukkan username',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Text(
                    "Kata sandi",
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: TextField(
                    controller: _passController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: 'Masukkan kata sandi',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text.rich(
              TextSpan(
                children: [
                  const TextSpan(text: "Belum memiliki akun ? "),
                  TextSpan(
                    text: "Daftar", // Ganti dari "Masuk" ke "Daftar"
                    style: TextStyle(
                      color: Colors.green[700],
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PemilihanRole()),
                        );
                      },
                  )
                ],
              ),
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
                  if (_nameController.text.isEmpty ||
                      _passController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Name dan Password tidak boleh kosong'),
                      ),
                    );
                    return;
                  }
                  final logUser = LoginUser(
                    name: _nameController.text,
                    password: _passController.text,
                  );
                  final _userProvider =
                      Provider.of<UserProvider>(context, listen: false);
                  _userProvider.loginUser(logUser).then((_) {
                    final List<User> users = _userProvider.users;
                    final User loggedInUser = users.first;
                    switch (loggedInUser.roleId) {
                      case 2:
                        Navigator.pushReplacementNamed(
                            context, '/homepageBendahara');
                        break;
                      case 3:
                        Navigator.pushReplacementNamed(
                            context, '/homepageSekertaris');
                        break;
                      case 4:
                        Navigator.pushReplacementNamed(
                            context, '/homepageTakmir');
                        break;
                      default:
                        Navigator.pushReplacementNamed(
                            context, '/homepageJamaah');
                        break;
                    }
                  }).catchError((error) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Login gagal'),
                      ),
                    );
                  });
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.green[700]),
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10.0), // Set corner radius
                    ),
                  ),
                ),
                child: const Text(
                  'Masuk',
                  style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
