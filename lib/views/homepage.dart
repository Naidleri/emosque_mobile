import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String selectedItem = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu cafe'),
      ),
      body: ListView(
        children: [
          CafeMenuItem(
            title: 'Espresso',
            description:
                'Sebuah minuman kopi hitam kuat yang dibuat dengan menekan uap melalui biji kopi yang digiling halus',
            onTap: () {
              setState(() {
                selectedItem = 'Espresso';
              });
            },
          ),
          CafeMenuItem(
            title: 'Latte',
            description:
                'Minuman kopi yang terbuat dari espresso dan susu yang dituangkan dengan busa',
            onTap: () {
              setState(() {
                selectedItem = 'Latte';
              });
            },
          ),
          CafeMenuItem(
            title: 'Cappuccino',
            description:
                'Minuman kopi yang terdiri dari espresso, susu, dan busa susu yang diaduk',
            onTap: () {
              setState(() {
                selectedItem = 'Cappuccino';
              });
            },
          ),
          CafeMenuItem(
            title: 'Mocha',
            description:
                'Minuman kopi yang menggabungkan espresso, cokelat, dan susu yang diaduk',
            onTap: () {
              setState(() {
                selectedItem = 'Mocha';
              });
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (selectedItem.isNotEmpty) {
            _showOrderConfirmation(context, selectedItem);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Silakan pilih menu terlebih dahulu!'),
              ),
            );
          }
        },
        child: Icon(Icons.shopping_cart),
      ),
    );
  }

  void _showOrderConfirmation(BuildContext context, String item) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Order Confirmation'),
          content: Text('Anda telah memesan $item. Terima kasih!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

class CafeMenuItem extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback onTap;

  const CafeMenuItem({
    Key? key,
    required this.title,
    required this.description,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(description),
      onTap: onTap,
    );
  }
}
