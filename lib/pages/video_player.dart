import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/material.dart';

class VideoPlayerPage extends StatefulWidget {
  const VideoPlayerPage({super.key});

  @override
  State<VideoPlayerPage> createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  late CustomVideoPlayerController customVideoPlayerController;
  @override
  void initState() {
    initializedVideoPlayer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video Player'),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,mainAxisSize: MainAxisSize.max,
        children: [
          CustomVideoPlayer(customVideoPlayerController: customVideoPlayerController),
        ],
      ),
    );
  }

  void initializedVideoPlayer() {
    VideoPlayerController videoPlayerController;
    videoPlayerController = VideoPlayerController.networkUrl(
      Uri.parse(
          'https://firebasestorage.googleapis.com/v0/b/exam-app-dfbb9.appspot.com/o/uploads%2FVID-20240808-WA0051.mp4?alt=media&token=147a41f8-9d7f-4f16-aece-de11c4b58cbb'),
    )..initialize().then((value) {
        setState(() {});
      });
    customVideoPlayerController = CustomVideoPlayerController(
        context: context, videoPlayerController: videoPlayerController);
  }
}
