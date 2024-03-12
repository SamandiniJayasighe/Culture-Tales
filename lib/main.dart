// // lib/main.dart

// import 'package:flutter/material.dart';
// import 'home.dart';
// import 'culture_list.dart';
// import 'sinhala.dart';
// import 'tamil.dart';
// import 'moor.dart';
// import 'burgher.dart';
// import 'malay.dart';
// import 'kaffir.dart';
// import 'parsi.dart';
// import 'gypsy.dart';
// import 'firebase_options.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Culture Stories App',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       initialRoute: '/',
//       routes: {
//         '/': (context) => const HomePage(),
//         '/culture_list': (context) => const CultureListPage(),
//         '/sinhala': (context) => const SinhalaPage(),
//         '/tamil': (context) => const TamilPage(),
//         '/moor': (context) => const MoorPage(),
//         '/burgher': (context) => const BurgherPage(),
//         '/malay': (context) => const MalayPage(),
//         '/kaffir': (context) => const KaffirPage(),
//         '/parsi': (context) => const ParsiPage(),
//         '/gypsy': (context) => const GypsyPage(),
//         '/firebase_options': (context)=> const DefaultFirebaseOptions(),
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'home.dart';
import 'culture_list.dart';
import 'sinhala.dart';
import 'tamil.dart';
import 'moor.dart';
import 'burgher.dart';
import 'malay.dart';
import 'kaffir.dart';
import 'parsi.dart';
import 'gypsy.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Culture Stories App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/culture_list': (context) => const CultureListPage(),
        '/sinhala': (context) => const SinhalaPage(),
        '/tamil': (context) => const TamilPage(),
        '/moor': (context) => const MoorPage(),
        '/burgher': (context) => const BurgherPage(),
        '/malay': (context) => const MalayPage(),
        '/kaffir': (context) => const KaffirPage(),
        '/parsi': (context) => const ParsiPage(),
        '/gypsy': (context) => const GypsyPage(),
      },
    );
  }
}
