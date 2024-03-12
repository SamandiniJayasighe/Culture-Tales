// // lib/sinhala.dart

// import 'package:flutter/material.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:audioplayers/audioplayers.dart';

// const Color myCustomColor = Color(0xFF7B014C);

// class BurgherPage extends StatelessWidget {
//   const BurgherPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: buildAppBar(context),
//       body: const BurgherBody(),
//     );
//   }

//   AppBar buildAppBar(BuildContext context) {
//     return AppBar(
//       title: const Text('Burgher Tales'),
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

// class BurgherBody extends StatelessWidget {
//   const BurgherBody({Key? key}) : super(key: key);
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
//               'The Burgher community, descended from European colonizers, adds a European influence to Sri Lanka s cultural mosaic, reflected in their cuisine, such as lamprais, and celebrations like Christmas and New Year with unique local twists.',
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

// import 'package:flutter/material.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:audioplayers/audioplayers.dart';

// const Color myCustomColor = Color(0xFF7B014C);

// class BurgherPage extends StatelessWidget {
//   const BurgherPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: buildAppBar(context),
//       body: const BurgherBody(),
//     );
//   }

//   AppBar buildAppBar(BuildContext context) {
//     return AppBar(
//       title: const Text('Burgher Tales'),
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

// class BurgherBody extends StatefulWidget {
//   const BurgherBody({Key? key}) : super(key: key);

//   @override
//   _BurgherBodyState createState() => _BurgherBodyState();
// }

// class _BurgherBodyState extends State<BurgherBody> {
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
//                 'The Burgher community, descended from European colonizers, adds a European influence to Sri Lanka s cultural mosaic, reflected in their cuisine, such as lamprais, and celebrations like Christmas and New Year with unique local twists.',
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

class BurgherPage extends StatelessWidget {
  const BurgherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: const BurgherBody(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text('Burgher Tales'),
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

class BurgherBody extends StatefulWidget {
  const BurgherBody({Key? key}) : super(key: key);

  @override
  _BurgherBodyState createState() => _BurgherBodyState();
}

class _BurgherBodyState extends State<BurgherBody> {
  AudioPlayer player = AudioPlayer();
  List<String> names = [
    "Burgher_English_Burgher Bridge of Understanding.mp3",
    "Burgher_Sinhala_Burgher Bridge of Understanding.wav",
    "Burgher_Tamil_Burgher Bridge of Understanding.wav",
    "Burgher_English_Whispers of Inclusion.mp3",
    "Burgher_Sinhala_Whispers of Inclusion.wav",
    "Burgher_Tamil_Whispers of Inclusion.wav"
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
            topic: 'Burgher Bridge of Understanding',
            description:
                'Symbol of Unity, Inclusivity and Acceptance, Shared Spaces for Interaction',
            stories: [
              AudioButton(title: 'Story In English', filePath: names[0]),
              AudioButton(title: 'Story In Sinhala', filePath: names[1]),
              AudioButton(title: 'Story In Tamil', filePath: names[2]),
            ],
          ),
          const SizedBox(height: 0.1),
          StoryBox(
            topic: 'Whispers of Inclusion',
            description:
                'Celebrating Diversity, Understanding and Empathy, Inclusive Initiatives',
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
