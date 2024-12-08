import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AudioPlayers Sample',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const AudioPlayersSample(),
    );
  }
}

class AudioPlayersSample extends StatefulWidget {
  const AudioPlayersSample({Key? key}) : super(key: key);

  @override
  State<AudioPlayersSample> createState() => _AudioPlayersSampleState();
}

class _AudioPlayersSampleState extends State<AudioPlayersSample> {
  final audioPlayer = AudioPlayer();

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AudioPlayers Sample"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                audioPlayer.play(AssetSource('audio/RPG_Battle_01.mp3'));
              },
              child: const Text("Play"),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  audioPlayer.releaseMode == ReleaseMode.release
                      ? audioPlayer.setReleaseMode(ReleaseMode.loop)
                      : audioPlayer.setReleaseMode(ReleaseMode.release);
                });
              },
              child: Text(audioPlayer.releaseMode == ReleaseMode.release
                  ? "Loop OFF"
                  : "Loop ON"),
            ),
            ElevatedButton(
              onPressed: () {
                audioPlayer.stop();
              },
              child: const Text("Stop"),
            ),
            ElevatedButton(
              onPressed: () {
                audioPlayer.pause();
              },
              child: const Text("Pause"),
            ),
            ElevatedButton(
              onPressed: () {
                audioPlayer.resume();
              },
              child: const Text("Resume"),
            ),
          ],
        ),
      ),
    );
  }
}
