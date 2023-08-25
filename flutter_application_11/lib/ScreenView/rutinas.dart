import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class RutinasViewComponent extends StatefulWidget {
  const RutinasViewComponent({super.key});

  @override
  State<RutinasViewComponent> createState() => _RutinasViewComponentState();
}

class _RutinasViewComponentState extends State<RutinasViewComponent> {
  @override
  Widget build(BuildContext context) {
    final List<String> videosUrl = [
      'https://www.youtube.com/watch?v=9v3uFEAL7Ys',
      'https://www.youtube.com/watch?v=GCy4djD-Lsg',
      'https://www.youtube.com/watch?v=AUTqIj21X7g'
    ];
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Rutinas de ejercicio'),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                for (int i = 0; i < 3; i++)
                YoutubePlayer(
                  controller: YoutubePlayerController(
                    initialVideoId: YoutubePlayer.convertUrlToId(videosUrl[i])!,
                    flags: const YoutubePlayerFlags(
                      autoPlay: false,
                      mute: false,
                    ),
                  ),
                  showVideoProgressIndicator: true,
                  progressIndicatorColor: Colors.blueAccent,
                  progressColors: const ProgressBarColors(
                    playedColor: Colors.blueAccent,
                    handleColor: Colors.blueAccent,
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
