// // lib/sinhala.dart

// import 'package:flutter/material.dart';

// const Color myCustomColor = Color(0xFF7B014C);

// class SinhalaPage extends StatelessWidget {
//   const SinhalaPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: buildAppBar(context),
//       body: const SinhalaBody(),
//     );
//   }

//   AppBar buildAppBar(BuildContext context) {
//     return AppBar(
//       title: const Text('Sinhala Tales'),
//       backgroundColor: myCustomColor,
//       actions: <Widget>[
//         IconButton(
//           icon: const Icon(Icons.home),
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//         ),
//       ],
//     );
//   }
// }

// class SinhalaBody extends StatelessWidget {
//   const SinhalaBody({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Container(
//           decoration: BoxDecoration(
//             color: myCustomColor.withOpacity(0.5),
//             borderRadius: BorderRadius.circular(10.0),
//           ),
//           margin: const EdgeInsets.all(16.0),
//           padding: const EdgeInsets.all(16.0),
//           child: const Center(
//             child: Text(
//               'The Sinhalese, the largest ethnic group in Sri Lanka, boast a rich cultural heritage characterized by traditional art forms such as Kandyan dance and distinctive rituals like the Sinhala and Tamil New Year celebrations.',
//               style: TextStyle(fontSize: 18.0, color: Colors.white),
//               textAlign: TextAlign.center, // Center the text within the box
//             ),
//           ),
//         ),
//         const SizedBox(height: 25.0),
//         AudioButton(title: 'Story 1', filePath: 'path_to_story_1.mp3'),
//         AudioButton(title: 'Story 2', filePath: 'path_to_story_2.mp3'),
//         AudioButton(title: 'Story 3', filePath: 'path_to_story_3.mp3'),
//         AudioButton(title: 'Story 4', filePath: 'path_to_story_4.mp3'),
//         AudioButton(title: 'Story 5', filePath: 'path_to_story_5.mp3'),
//       ],
//     );
//   }
// }

// class AudioButton extends StatefulWidget {
//   final String title;
//   final String filePath;

//   const AudioButton({Key? key, required this.title, required this.filePath})
//       : super(key: key);

//   @override
//   _AudioButtonState createState() => _AudioButtonState();
// }

// class _AudioButtonState extends State<AudioButton> {
//   bool isPlaying = false;

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       title: Text(widget.title),
//       trailing: IconButton(
//         icon: Icon(isPlaying ? Icons.stop : Icons.play_arrow),
//         onPressed: () {
//           setState(() {
//             isPlaying = !isPlaying;
//           });
//         },
//       ),
//     );
//   }
// }

// lib/sinhala.dart

// //import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// //import 'package:docx_to_text/docx_to_text.dart';
// import 'package:audioplayers/audioplayers.dart';

// const Color myCustomColor = Color(0xFF7B014C);

// class SinhalaPage extends StatelessWidget {
//   const SinhalaPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: buildAppBar(context),
//       body: const SinhalaBody(),
//     );
//   }

//   AppBar buildAppBar(BuildContext context) {
//     return AppBar(
//       title: const Text('Sinhala Tales'),
//       backgroundColor: myCustomColor,
//       actions: <Widget>[
//         IconButton(
//           icon: const Icon(Icons.home),
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//         ),
//       ],
//     );
//   }
// }

// class SinhalaBody extends StatefulWidget {
//   const SinhalaBody({Key? key}) : super(key: key);

//   @override
//   _SinhalaBodyState createState() => _SinhalaBodyState();
// }

// class _SinhalaBodyState extends State<SinhalaBody> {
//   AudioPlayer player = AudioPlayer();
//   List<String> names = [
//     "king_dutugemunu_sinhala.mp3",
//     "king_dutugemunu_english.mp3",
//     "saradiyel_english.mp3"
//   ];
//   @override
//   void initState() {
//     super.initState();
//   }

//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//         child: Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Container(
//           decoration: BoxDecoration(
//             color: myCustomColor.withOpacity(0.5),
//             borderRadius: BorderRadius.circular(10.0),
//           ),
//           margin: const EdgeInsets.all(16.0),
//           padding: const EdgeInsets.all(16.0),
//           child: Center(
//             child: Text(
//               'The Sinhalese, the largest ethnic group in Sri Lanka, boast a rich cultural heritage characterized by traditional art forms such as Kandyan dance and distinctive rituals like the Sinhala and Tamil New Year celebrations.',
//               style: TextStyle(fontSize: 18.0, color: Colors.white),
//               textAlign: TextAlign.center, // Center the text within the box
//             ),
//           ),
//         ),
//         const SizedBox(height: 25.0),
//         AudioButton(title: 'Story 1', filePath: names[0]),
//         AudioButton(title: 'Story 1', filePath: names[1]),
//         AudioButton(title: 'Story 1', filePath: names[2]),
//       ],
//     ));
//   }
// }

// class AudioButton extends StatefulWidget {
//   final String title;
//   final String filePath;
//   const AudioButton({Key? key, required this.title, required this.filePath})
//       : super(key: key);

//   @override
//   _AudioButtonState createState() => _AudioButtonState();
// }

// class _AudioButtonState extends State<AudioButton> {
//   bool isPlaying = false;
//   String fileURL = "";
//   AudioPlayer player = AudioPlayer();
//   FirebaseStorage _storage = FirebaseStorage.instance;
//   Future<String> obtainURL(String name) async {
//     try {
//       var fileData = await _storage.ref().child(name).getDownloadURL();
//       return fileData;
//     } catch (e) {
//       return "";
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     player.onPlayerStateChanged.listen((event) {
//       switch (event) {
//         case PlayerState.playing:
//           setState(() {
//             isPlaying = true;
//           });
//         case PlayerState.paused:
//           setState(() {
//             isPlaying = false;
//           });
//         case PlayerState.stopped:
//           setState(() {
//             isPlaying = false;
//           });
//           break;
//         case PlayerState.completed:
//           setState(() {
//             isPlaying = false;
//           });
//           break;
//         default:
//           break;
//       }
//     });
//   }

//   void dispose() {
//     print('Dispose used');
//     player.stop();
//     super.dispose();
//   }

//   Widget build(BuildContext context) {
//     return ListTile(
//       title: Text(widget.title),
//       trailing: IconButton(
//         icon: Icon(isPlaying ? Icons.stop : Icons.play_arrow),
//         onPressed: () async {
//           if (!isPlaying) {
//             fileURL = await obtainURL(widget.filePath);
//           }
//           if (!isPlaying) {
//             await player.play(UrlSource(fileURL));
//           } else {
//             await player.pause();
//           }
//         },
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:audioplayers/audioplayers.dart';

// const Color myCustomColor = Color(0xFF7B014C);

// class SinhalaPage extends StatelessWidget {
//   const SinhalaPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: buildAppBar(context),
//       body: const SinhalaBody(),
//     );
//   }

//   AppBar buildAppBar(BuildContext context) {
//     return AppBar(
//       title: const Text('Sinhala Tales'),
//       backgroundColor: myCustomColor,
//       actions: <Widget>[
//         IconButton(
//           icon: const Icon(Icons.home),
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//         ),
//       ],
//     );
//   }
// }

// class SinhalaBody extends StatefulWidget {
//   const SinhalaBody({Key? key}) : super(key: key);

//   @override
//   _SinhalaBodyState createState() => _SinhalaBodyState();
// }

// class _SinhalaBodyState extends State<SinhalaBody> {
//   AudioPlayer player = AudioPlayer();
//   List<String> names = [
//     "king_dutugemunu_sinhala.mp3",
//     "king_dutugemunu_english.mp3",
//     "saradiyel_english.mp3"
//   ];

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   void dispose() {
//     player.dispose(); // Dispose of the player when the widget is disposed
//     super.dispose();
//   }

//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Container(
//             decoration: BoxDecoration(
//               color: myCustomColor.withOpacity(0.5),
//               borderRadius: BorderRadius.circular(10.0),
//             ),
//             margin: const EdgeInsets.all(16.0),
//             padding: const EdgeInsets.all(16.0),
//             child: Center(
//               child: Text(
//                 'The Sinhalese, the largest ethnic group in Sri Lanka, boast a rich cultural heritage characterized by traditional art forms such as Kandyan dance and distinctive rituals like the Sinhala and Tamil New Year celebrations.',
//                 style: TextStyle(fontSize: 18.0, color: Colors.white),
//                 textAlign: TextAlign.center,
//               ),
//             ),
//           ),
//           const SizedBox(height: 25.0),
//           AudioButton(title: 'King Dutugemunu (Sinhala)', filePath: names[0]),
//           AudioButton(title: 'King Dutugemunu (English)', filePath: names[1]),
//           AudioButton(title: 'Saradiyel (English)', filePath: names[2]),
//         ],
//       ),
//     );
//   }
// }

// class AudioButton extends StatefulWidget {
//   final String title;
//   final String filePath;

//   const AudioButton({Key? key, required this.title, required this.filePath})
//       : super(key: key);

//   @override
//   _AudioButtonState createState() => _AudioButtonState();
// }

// class _AudioButtonState extends State<AudioButton> {
//   bool isPlaying = false;
//   String fileURL = "";
//   AudioPlayer player = AudioPlayer();

//   FirebaseStorage _storage = FirebaseStorage.instance;

//   Future<String> obtainURL(String name) async {
//     try {
//       var fileData = await _storage.ref().child(name).getDownloadURL();
//       return fileData;
//     } catch (e) {
//       return "";
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     player.onPlayerStateChanged.listen((event) {
//       switch (event) {
//         case PlayerState.playing:
//           setState(() {
//             isPlaying = true;
//           });
//           break;
//         case PlayerState.paused:
//           setState(() {
//             isPlaying = false;
//           });
//           break;
//         case PlayerState.stopped:
//           setState(() {
//             isPlaying = false;
//           });
//           break;
//         case PlayerState.completed:
//           setState(() {
//             isPlaying = false;
//           });
//           break;
//         default:
//           break;
//       }
//     });
//   }

//   @override
//   void dispose() {
//     player.dispose(); // Dispose of the player when the widget is disposed
//     super.dispose();
//   }

//   Widget build(BuildContext context) {
//     return ListTile(
//       title: Text(widget.title),
//       subtitle: Text(isPlaying ? 'Playing' : 'Paused'),
//       trailing: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           IconButton(
//             icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
//             onPressed: () async {
//               if (!isPlaying) {
//                 fileURL = await obtainURL(widget.filePath);
//               }
//               if (!isPlaying) {
//                 await player.play(UrlSource(fileURL));
//               } else {
//                 await player.pause();
//               }
//             },
//           ),
//           IconButton(
//             icon: Icon(Icons.stop),
//             onPressed: () async {
//               await player.stop();
//             },
//           ),
//           IconButton(
//             icon: Icon(Icons.replay),
//             onPressed: () async {
//               await player.seek(Duration.zero);
//               await player.play(UrlSource(fileURL));
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:audioplayers/audioplayers.dart';

// const Color myCustomColor = Color(0xFF7B014C);

// class SinhalaPage extends StatelessWidget {
//   const SinhalaPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: buildAppBar(context),
//       body: const SinhalaBody(),
//     );
//   }

//   AppBar buildAppBar(BuildContext context) {
//     return AppBar(
//       title: const Text('Sinhala Tales'),
//       backgroundColor: myCustomColor,
//       actions: <Widget>[
//         IconButton(
//           icon: const Icon(Icons.home),
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//         ),
//       ],
//     );
//   }
// }

// class SinhalaBody extends StatefulWidget {
//   const SinhalaBody({Key? key}) : super(key: key);

//   @override
//   _SinhalaBodyState createState() => _SinhalaBodyState();
// }

// class _SinhalaBodyState extends State<SinhalaBody> {
//   AudioPlayer player = AudioPlayer();
//   List<String> names = [
//     "king_dutugemunu_sinhala.mp3",
//     "king_dutugemunu_english.mp3",
//     "saradiyel_english.mp3"
//   ];

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   void dispose() {
//     player.dispose(); // Dispose of the player when the widget is disposed
//     super.dispose();
//   }

//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Container(
//             decoration: BoxDecoration(
//               color: myCustomColor.withOpacity(0.5),
//               borderRadius: BorderRadius.circular(10.0),
//             ),
//             margin: const EdgeInsets.all(16.0),
//             padding: const EdgeInsets.all(16.0),
//             child: Center(
//               child: Text(
//                 'The Sinhalese, the largest ethnic group in Sri Lanka, boast a rich cultural heritage characterized by traditional art forms such as Kandyan dance and distinctive rituals like the Sinhala and Tamil New Year celebrations.',
//                 style: TextStyle(fontSize: 18.0, color: Colors.white),
//                 textAlign: TextAlign.center,
//               ),
//             ),
//           ),
//           const SizedBox(height: 25.0),
//           AudioButton(title: 'Story 1', filePath: names[0]),
//           AudioButton(title: 'Story 2', filePath: names[1]),
//           AudioButton(title: 'Story 3', filePath: names[2]),
//         ],
//       ),
//     );
//   }
// }

// class AudioButton extends StatefulWidget {
//   final String title;
//   final String filePath;

//   const AudioButton({Key? key, required this.title, required this.filePath})
//       : super(key: key);

//   @override
//   _AudioButtonState createState() => _AudioButtonState();
// }

// class _AudioButtonState extends State<AudioButton> {
//   bool isPlaying = false;
//   String fileURL = "";
//   AudioPlayer player = AudioPlayer();

//   FirebaseStorage _storage = FirebaseStorage.instance;

//   Future<String> obtainURL(String name) async {
//     try {
//       var fileData = await _storage.ref().child(name).getDownloadURL();
//       return fileData;
//     } catch (e) {
//       return "";
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     player.onPlayerStateChanged.listen((event) {
//       switch (event) {
//         case PlayerState.playing:
//           setState(() {
//             isPlaying = true;
//           });
//           break;
//         case PlayerState.paused:
//           setState(() {
//             isPlaying = false;
//           });
//           break;
//         case PlayerState.stopped:
//           setState(() {
//             isPlaying = false;
//           });
//           break;
//         case PlayerState.completed:
//           setState(() {
//             isPlaying = false;
//           });
//           break;
//         default:
//           break;
//       }
//     });
//   }

//   @override
//   void dispose() {
//     player.dispose(); // Dispose of the player when the widget is disposed
//     super.dispose();
//   }

//   Widget build(BuildContext context) {
//     return ListTile(
//       title: Text(widget.title),
//       subtitle: Text(isPlaying ? 'Playing' : 'Paused'),
//       trailing: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           IconButton(
//             icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
//             onPressed: () async {
//               if (!isPlaying) {
//                 fileURL = await obtainURL(widget.filePath);
//               }

//               if (!isPlaying) {
//                 await player.play(UrlSource(fileURL));
//               } else {
//                 await player.pause();
//               }

//               // Ensure the isPlaying state is updated after the player state changes
//               // This prevents a potential race condition
//               setState(() {});
//             },
//           ),
//           IconButton(
//             icon: Icon(Icons.stop),
//             onPressed: () async {
//               await player.stop();
//             },
//           ),
//           IconButton(
//             icon: Icon(Icons.replay),
//             onPressed: () async {
//               await player.seek(Duration.zero);
//               await player.play(UrlSource(fileURL));
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:audioplayers/audioplayers.dart';

// const Color myCustomColor = Color(0xFF7B014C);

// class SinhalaPage extends StatelessWidget {
//   const SinhalaPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: buildAppBar(context),
//       body: const SinhalaBody(),
//     );
//   }

//   AppBar buildAppBar(BuildContext context) {
//     return AppBar(
//       title: const Text('Sinhala Tales'),
//       backgroundColor: myCustomColor,
//       actions: <Widget>[
//         IconButton(
//           icon: const Icon(Icons.home),
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//         ),
//       ],
//     );
//   }
// }

// class SinhalaBody extends StatefulWidget {
//   const SinhalaBody({Key? key}) : super(key: key);

//   @override
//   _SinhalaBodyState createState() => _SinhalaBodyState();
// }

// class _SinhalaBodyState extends State<SinhalaBody> {
//   AudioPlayer player = AudioPlayer();
//   List<String> names = [
//     "king_dutugemunu_sinhala.mp3",
//     "king_dutugemunu_english.mp3",
//     "saradiyel_english.mp3"
//   ];

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   void dispose() {
//     player.dispose(); // Dispose of the player when the widget is disposed
//     super.dispose();
//   }

//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Container(
//             decoration: BoxDecoration(
//               color: myCustomColor.withOpacity(0.5),
//               borderRadius: BorderRadius.circular(10.0),
//             ),
//             margin: const EdgeInsets.all(16.0),
//             padding: const EdgeInsets.all(16.0),
//             child: Center(
//               child: Text(
//                 'The Sinhalese, the largest ethnic group in Sri Lanka, boast a rich cultural heritage characterized by traditional art forms such as Kandyan dance and distinctive rituals like the Sinhala and Tamil New Year celebrations.',
//                 style: TextStyle(fontSize: 18.0, color: Colors.white),
//                 textAlign: TextAlign.center,
//               ),
//             ),
//           ),
//           const SizedBox(height: 25.0),
//           AudioButton(title: 'Story 1', filePath: names[0]),
//           AudioButton(title: 'Story 2', filePath: names[1]),
//           AudioButton(title: 'Story 3', filePath: names[2]),
//         ],
//       ),
//     );
//   }
// }

// class AudioButton extends StatefulWidget {
//   final String title;
//   final String filePath;

//   const AudioButton({Key? key, required this.title, required this.filePath})
//       : super(key: key);

//   @override
//   _AudioButtonState createState() => _AudioButtonState();
// }

// class _AudioButtonState extends State<AudioButton> {
//   bool isPlaying = false;
//   bool isLoading = false; // New loading indicator state
//   String fileURL = "";
//   AudioPlayer player = AudioPlayer();

//   FirebaseStorage _storage = FirebaseStorage.instance;

//   Future<String> obtainURL(String name) async {
//     try {
//       var fileData = await _storage.ref().child(name).getDownloadURL();
//       return fileData;
//     } catch (e) {
//       return "";
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     player.onPlayerStateChanged.listen((event) {
//       switch (event) {
//         case PlayerState.playing:
//           // Reset loading indicator when playback starts
//           setState(() {
//             isPlaying = true;
//             isLoading = false;
//           });
//           break;
//         case PlayerState.paused:
//           setState(() {
//             isPlaying = false;
//           });
//           break;
//         case PlayerState.stopped:
//           setState(() {
//             isPlaying = false;
//             isLoading = false;
//           });
//           break;
//         case PlayerState.completed:
//           setState(() {
//             isPlaying = false;
//             isLoading = false;
//           });
//           break;
//         default:
//           break;
//       }
//     });
//   }

//   @override
//   void dispose() {
//     player.dispose();
//     super.dispose();
//   }

//   Widget build(BuildContext context) {
//     return ListTile(
//       title: Text(widget.title),
//       subtitle: Text(
//         isPlaying ? 'Playing' : (isLoading ? 'Loading...' : 'Paused'),
//       ),
//       trailing: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           IconButton(
//             icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
//             onPressed: () async {
//               if (!isPlaying) {
//                 // Set loading indicator when starting to play
//                 setState(() {
//                   isLoading = true;
//                 });
//                 fileURL = await obtainURL(widget.filePath);
//               }

//               if (!isPlaying) {
//                 await player.play(UrlSource(fileURL));
//               } else {
//                 await player.pause();
//               }

//               setState(() {});
//             },
//           ),
//           IconButton(
//             icon: Icon(Icons.stop),
//             onPressed: () async {
//               await player.stop();
//               setState(() {
//                 isLoading =
//                     false; // Reset loading indicator when stopping the audio
//               });
//             },
//           ),
//           IconButton(
//             icon: Icon(Icons.replay),
//             onPressed: () async {
//               await player.seek(Duration.zero);
//               await player.play(UrlSource(fileURL));
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:audioplayers/audioplayers.dart';

const Color myCustomColor = Color(0xFF7B014C);

class SinhalaPage extends StatelessWidget {
  const SinhalaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: const SinhalaBody(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text('Sinhala Tales'),
      backgroundColor: myCustomColor,
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.home),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}

class SinhalaBody extends StatefulWidget {
  const SinhalaBody({Key? key}) : super(key: key);

  @override
  _SinhalaBodyState createState() => _SinhalaBodyState();
}

class _SinhalaBodyState extends State<SinhalaBody> {
  AudioPlayer player = AudioPlayer();
  List<String> names = [
    "Sinhala_English_Dutugamunu.mp3",
    "king_dutugemunu_sinhala.mp3",
    "Sinhala_Tamil_Dutugamunu.wav",
    "Sinhala_English_Saradiyel.mp3",
    "Sinhala_Sinhala_Saradiyel.wav",
    "Sinhala_Tamil_Saradiyel.wav"
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    player.dispose(); // Dispose of the player when the widget is disposed
    super.dispose();
  }

  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          StoryBox(
            topic: 'King Dutugamunu',
            description:
                'Visionary Leadership and Unity, Courage and Determination in the Face of Challenges, Legacy and National Pride',
            stories: [
              AudioButton(title: 'Story In English', filePath: names[0]),
              AudioButton(title: 'Story In Sinhala', filePath: names[1]),
              AudioButton(title: 'Story In Tamil', filePath: names[2]),
            ],
          ),
          const SizedBox(height: 5.0),
          StoryBox(
            topic: 'Saradiyel',
            description:
                'Symbol of Resistance and Justice, Folk Hero and Robin Hood Figure, Legacy of Inspiration',
            stories: [
              AudioButton(title: 'Story In English', filePath: names[3]),
              AudioButton(title: 'Story In Sinhala', filePath: names[4]),
              AudioButton(title: 'Story In Tamil', filePath: names[5]),
            ],
          ),
          // Add more StoryBoxes as needed
        ],
      ),
    );
  }
}

class StoryBox extends StatelessWidget {
  final String topic;
  final String description;
  final List<Widget> stories;

  const StoryBox({
    Key? key,
    required this.topic,
    required this.description,
    required this.stories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: myCustomColor.withOpacity(0.5),
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: const EdgeInsets.all(16.0),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            topic,
            style: TextStyle(fontSize: 20.0, color: Colors.white),
          ),
          const SizedBox(height: 10.0),
          Text(
            description,
            style: TextStyle(fontSize: 16.0, color: Colors.black),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10.0),
          ...stories,
        ],
      ),
    );
  }
}

class AudioButton extends StatefulWidget {
  final String title;
  final String filePath;

  const AudioButton({Key? key, required this.title, required this.filePath})
      : super(key: key);

  @override
  _AudioButtonState createState() => _AudioButtonState();
}

class _AudioButtonState extends State<AudioButton> {
  bool isPlaying = false;
  bool isLoading = false; // New loading indicator state
  String fileURL = "";
  AudioPlayer player = AudioPlayer();

  FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String> obtainURL(String name) async {
    try {
      var fileData = await _storage.ref().child(name).getDownloadURL();
      return fileData;
    } catch (e) {
      return "";
    }
  }

  @override
  void initState() {
    super.initState();
    player.onPlayerStateChanged.listen((event) {
      switch (event) {
        case PlayerState.playing:
          // Reset loading indicator when playback starts
          setState(() {
            isPlaying = true;
            isLoading = false;
          });
          break;
        case PlayerState.paused:
          setState(() {
            isPlaying = false;
          });
          break;
        case PlayerState.stopped:
          setState(() {
            isPlaying = false;
            isLoading = false;
          });
          break;
        case PlayerState.completed:
          setState(() {
            isPlaying = false;
            isLoading = false;
          });
          break;
        default:
          break;
      }
    });
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.title),
      subtitle: Text(
        isPlaying ? 'Playing' : (isLoading ? 'Loading...' : 'Paused'),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
            onPressed: () async {
              if (!isPlaying) {
                // Set loading indicator when starting to play
                setState(() {
                  isLoading = true;
                });
                fileURL = await obtainURL(widget.filePath);
              }

              if (!isPlaying) {
                await player.play(UrlSource(fileURL));
              } else {
                await player.pause();
              }

              setState(() {});
            },
          ),
          IconButton(
            icon: Icon(Icons.stop),
            onPressed: () async {
              await player.stop();
              setState(() {
                isLoading =
                    false; // Reset loading indicator when stopping the audio
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.replay),
            onPressed: () async {
              await player.seek(Duration.zero);
              await player.play(UrlSource(fileURL));
            },
          ),
        ],
      ),
    );
  }
}
