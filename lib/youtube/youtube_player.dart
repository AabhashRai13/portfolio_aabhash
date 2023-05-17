import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

///
class YoutubePlayerScreen extends StatefulWidget {
  const YoutubePlayerScreen({super.key});

  @override
  YoutubePlayerScreenState createState() => YoutubePlayerScreenState();
}

class YoutubePlayerScreenState extends State<YoutubePlayerScreen> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      params: const YoutubePlayerParams(
        showControls: true,
        mute: false,
        showFullscreenButton: true,
        loop: false,
      ),
    );

    _controller.setFullScreenListener(
      (isFullScreen) {
        log('${isFullScreen ? 'Entered' : 'Exited'} Fullscreen.');
      },
    );

    _controller.loadVideoById(videoId: "jz3I9OLzbb8");
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerScaffold(
      controller: _controller,
      builder: (context, player) {
        return player;
      },
    );
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }
}
