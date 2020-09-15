import 'package:app_video/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.asset("assets/beach.mp4")
      ..initialize().then((context) {
        _videoPlayerController.play();
        _videoPlayerController.setLooping(true);
        setState(() {});
      });
  }

  @override
  void dispose() {
    super.dispose();
    _videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                  height: _videoPlayerController?.value?.size?.height ?? 0,
                  width: _videoPlayerController?.value?.size?.width ?? 0,
                  child: VideoPlayer(_videoPlayerController)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 61, left: 61, top: 60, bottom: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        'Travel now',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                          fontFamily: 'Inter',
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Sua agência de viagens virtual',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Inter',
                        ),
                      ),
                    ],
                  ),
                ),
                RoundButton(
                  label: 'Criar uma conta',
                ),
                SizedBox(
                  height: 20,
                ),
                RoundButton(
                  label: 'Login',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
