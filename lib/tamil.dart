// // lib/sinhala.dart

// import 'package:flutter/material.dart';

// const Color myCustomColor = Color(0xFF7B014C);

// class TamilPage extends StatelessWidget {
//   const TamilPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: buildAppBar(context),
//       body: const TamilBody(),
//     );
//   }

//   AppBar buildAppBar(BuildContext context) {
//     return AppBar(
//       title: const Text('Tamil Tales'),
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

// class TamilBody extends StatelessWidget {
//   const TamilBody({Key? key}) : super(key: key);
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
//               'The Tamil community in Sri Lanka contributes to the nation s diversity with its unique language and vibrant cultural practices, including classical dance forms like Bharatanatyam and the celebration of Pongal a harvest festival.',
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

// class TamilPage extends StatelessWidget {
//   const TamilPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: buildAppBar(context),
//       body: const TamilBody(),
//     );
//   }

//   AppBar buildAppBar(BuildContext context) {
//     return AppBar(
//       title: const Text('Tamil Tales'),
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

// class TamilBody extends StatefulWidget {
//   const TamilBody({Key? key}) : super(key: key);

//   @override
//   _TamilBodyState createState() => _TamilBodyState();
// }

// class _TamilBodyState extends State<TamilBody> {
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
//                 'The Tamil community in Sri Lanka contributes to the nation s diversity with its unique language and vibrant cultural practices, including classical dance forms like Bharatanatyam and the celebration of Pongal a harvest festival.',
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

class TamilPage extends StatelessWidget {
  const TamilPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: const TamilBody(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text('Tamil Tales'),
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

class TamilBody extends StatefulWidget {
  const TamilBody({Key? key}) : super(key: key);

  @override
  _TamilBodyState createState() => _TamilBodyState();
}

class _TamilBodyState extends State<TamilBody> {
  AudioPlayer player = AudioPlayer();
  List<String> names = [
    "Tamil_English_Diwali Festival.mp3",
    "Tamil_Sinhala_Diwali Festival.mp3",
    "Tamil_Tamil_Diwali Festival.mp3",
    "Tamil_English_Kadal, Munni and Kakka story.mp3",
    "Tamil_Sinhala_Kadal, Munni and Kakka story.mp3",
    "Tamil_Tamil_Kadal, Munni and Kakka story.mp3"
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
            topic: 'Diwali Festival',
            description:
                'Diwali is also known as the "Festival of Lights." It is a time to celebrate the victory of light over darkness and good over evil. The story of Diwali involves a wise and kind prince named Rama.',
            stories: [
              AudioButton(title: 'Story In English', filePath: names[0]),
              AudioButton(title: 'Story In Sinhala', filePath: names[1]),
              AudioButton(title: 'Story In Tamil', filePath: names[2]),
            ],
          ),
          const SizedBox(height: 5.0),
          StoryBox(
            topic: 'Kadal, Munni and Kakka story',
            description:
                'The story encourages emotional expression and awareness. It emphasizes the importance of open communication. Acceptance and understanding of differences are promoted.The story highlights the value of friendship and cooperation.',
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
