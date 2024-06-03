import 'package:emosque_mobile/models/models.dart';
import 'package:emosque_mobile/providers/providers.dart';
import 'package:emosque_mobile/views/auth/pemilihan_role.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _passController = TextEditingController();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Masuk",
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
                color: Color.fromARGB(255, 6, 215, 115)),
          ),
          const SizedBox(
            height: 40,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Text(
                  "Alamat email",
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ), // Ganti dari "Email" ke "Name"
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: TextField(
                  controller: _nameController, // Tambahkan controller
                  decoration: const InputDecoration(
                    hintText: 'Masukkan email',
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
                  controller: _passController, // Tambahkan controller
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
                  style: const TextStyle(
                    color: Color.fromARGB(255, 6, 215, 115),
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const PemilihanRole()),
                      );
                    },
                )
              ],
            ),
          ),
          ElevatedButton(
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
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 6, 215, 115),
            ),
            child: const Text(
              'Masuk',
              style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
            ),
          ),
        ],
      ),
    );
  }
}
