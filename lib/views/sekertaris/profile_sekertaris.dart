import 'package:emosque_mobile/models/models.dart';
import 'package:emosque_mobile/providers/providers.dart';
import 'package:emosque_mobile/widgets/fillButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:badges/badges.dart' as badges;
import 'package:provider/provider.dart';

class ProfileSekertaris extends StatefulWidget {
  const ProfileSekertaris({super.key});

  @override
  State<ProfileSekertaris> createState() => _ProfileSekertarisState();
}

class _ProfileSekertarisState extends State<ProfileSekertaris> {
  @override
  void initState() {
    super.initState();
    checkToken();
    // getUserData();
  }

  //  void getUserData() {
  //   final userProvider = Provider.of<UserProvider>(context, listen: false);
  //   userProvider.getProfile();
  // }

  Future<void> checkToken() async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final token = await userProvider.getTokenFromStorage();
    if (token == null) {
      // Jika tidak ada token, arahkan pengguna ke halaman login
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  Widget text(String judul, String text, BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            judul,
            style: GoogleFonts.poppins(
                fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black),
          ),
          const SizedBox(height: 5),
          Container(
            decoration: BoxDecoration(
                border: Border.all(width: 2, color: Colors.green),
                borderRadius: BorderRadius.circular(10)),
            padding: const EdgeInsets.only(top: 16, left: 15),
            height: 60,
            width: MediaQuery.of(context).size.width * 0.85,
            child: Text(
              text,
              style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = Provider.of<UserProvider>(context);
    if (userProvider.users.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }
    final User loggedInUser = userProvider.users.first;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.green[700]),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            badges.Badge(
              badgeStyle: const badges.BadgeStyle(badgeColor: Colors.green),
              position: badges.BadgePosition.bottomStart(),
              badgeContent: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.edit,
                    color: Colors.white,
                  )),
              child: const CircleAvatar(
                radius: 60,
                backgroundImage:
                    NetworkImage('https://example.com/your-image-url.jpg'),
              ),
            ),
            text('Username', loggedInUser.name, context),
            text('Email', loggedInUser.email, context),
            text('Role pengurus', 'Sekretaris Takmir', context),
            SizedBox(
              height: 20,
            ),
            fillButton(
                text: 'Log out',
                onPressed: () {
                  userProvider.logoutUser(context).then((_) {
                    Navigator.pushReplacementNamed(context, '/login');
                  });
                }),
          ],
        ),
      ),
    );
  }
}
