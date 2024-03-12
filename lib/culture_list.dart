// lib/culture_list.dart

import 'package:flutter/material.dart';
import 'sinhala.dart';
import 'tamil.dart';
import 'moor.dart';
import 'burgher.dart';
import 'malay.dart';
import 'kaffir.dart';
import 'parsi.dart';
import 'gypsy.dart';

const Color myCustomColor = Color(0xFF7B014C);
const Color customColor = Color(0xFFE4CCDB);

class CultureListPage extends StatelessWidget {
  const CultureListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Culture Tales'),
        backgroundColor: myCustomColor,
        actions: [
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              Navigator.popUntil(context, ModalRoute.withName('/'));
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 20, 10, 10), // Add gaps
        child: GridView.count(
          crossAxisCount: 2,
          children: [
            CultureBox(
              'assets/images/sinhala_image.png',
              SinhalaPage(),
              'Sinhala',
            ),
            CultureBox(
              'assets/images/tamil_image.png',
              TamilPage(),
              'Tamil',
            ),
            CultureBox(
              'assets/images/moor_image.png',
              MoorPage(),
              'Moors',
            ),
            CultureBox(
              'assets/images/burgher_image.png',
              BurgherPage(),
              'Burgher',
            ),
            CultureBox(
              'assets/images/malay_image.png',
              MalayPage(),
              'Malays',
            ),
            CultureBox(
              'assets/images/kaffir_image.png',
              KaffirPage(),
              'Black African',
            ),
            CultureBox(
              'assets/images/parsi_image.png',
              ParsiPage(),
              'Parsis',
            ),
            CultureBox(
              'assets/images/gypsy_image.png',
              GypsyPage(),
              'Gypsy',
            ),
          ],
        ),
      ),
    );
  }
}

class CultureBox extends StatelessWidget {
  final String imagePath;
  final Widget page;
  final String buttonText;

  const CultureBox(this.imagePath, this.page, this.buttonText, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        color: customColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                width: 120, // Enlarge the image
                height: 120, // Enlarge the image
              ),
            ),
            const SizedBox(height: 5),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => page),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: myCustomColor,
                minimumSize: const Size(100, 40), // Reduce button size
              ),
              child: Text(
                buttonText,
                style: const TextStyle(fontSize: 14, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
