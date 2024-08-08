import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class AudioPlayerPage extends StatefulWidget {
  const AudioPlayerPage({super.key});

  @override
  State<AudioPlayerPage> createState() => _AudioPlayerPageState();
}

class _AudioPlayerPageState extends State<AudioPlayerPage> {
  final player = AudioPlayer();
  String formatDuration(Duration d){
    final minutes = d.inMinutes.remainder(60);
    final seconds = d.inSeconds.remainder(60);
    return "${minutes.toString().padLeft(2,'0')}:${seconds.toString().padLeft(2,'0')}";
    
  }
  void handlePlayPause(){
    if (player.playing) {
      player.pause();
    }
    else{
      player.play();
    }
  }
  Duration position = Duration.zero;
  Duration duration = Duration.zero;

  void handleSeek(double value){
    player.seek(Duration(seconds: value.toInt()));
  }
  @override
  void initState() {player.setUrl('https://firebasestorage.googleapis.com/v0/b/exam-app-dfbb9.appspot.com/o/uploads%2FHow%20Long(MP3_160K).mp3?alt=media&token=473c84d9-1367-464c-8316-f2b479ce5324');
  player.positionStream.listen((p){setState(() {
    position = p;
  },);},);
  player.durationStream.listen((d){setState(() {
    duration = d!;
  },);},);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Player'),
      ),
body: Column(children: [
  Text(
    formatDuration(position)
  
  ),
  Slider(value: position.inSeconds.toDouble(),min: 0.0,max: position.inSeconds.toDouble(), onChanged: handleSeek)
],)  );
  }
}
