// lib/home.dart

import 'package:flutter/material.dart';
import 'culture_list.dart';

const Color myCustomColor = Color(0xFF7B014C);

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16), // Set padding to zero
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/images/logo.png',
                width: 300,
              ),
              const SizedBox(height: 3),
              const Text(
                'Culture Tales allows you to listen to unique cultural stories from cultures in Sri Lanka',
                style: TextStyle(fontSize: 15, color: myCustomColor),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CultureListPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: myCustomColor,
                  minimumSize: const Size(130, 50),
                ),
                child: const Text(
                  'Explore',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
