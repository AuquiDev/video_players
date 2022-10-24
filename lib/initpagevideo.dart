
import 'package:chewie/chewie.dart';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Init2Page extends StatefulWidget {
  const Init2Page({Key? key}) : super(key: key);

  @override
  State<Init2Page> createState() => _Init2PageState();
}

class _Init2PageState extends State<Init2Page> {

  VideoPlayerController? _controller;
  @override
  void  initState() {
    super.initState();


    _controller   = VideoPlayerController.network(
      'https://assets.mixkit.co/videos/preview/mixkit-silhouette-of-a-lighthouse-during-sunset-3981-large.mp4',
    
     )..initialize().then((_) {
         setState(() {});
     });
  }

  @override
  void dispose() {
    super.dispose();
    _controller!.dispose();
  }
  @override
  Widget build(BuildContext context) {
     final chewieController = ChewieController(
      videoPlayerController: _controller!,
      autoPlay: true,
      looping: true,
    );
  double height = MediaQuery.of(context).size.height;
    return Container(
      decoration: const BoxDecoration(
        color: Colors.red,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            "https://images.pexels.com/photos/3264723/pexels-photo-3264723.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
          ),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
         // mainAxisAlignment: MainAxisAlignment.end,
          children: [

            Positioned.fill(
              top: height * -.2,
              child: Container(
                child: _controller!.value.isInitialized
                    ? AspectRatio(
                        aspectRatio: _controller!.value.aspectRatio,
                        child: Chewie(
                          controller: chewieController,
                        ),
                      )
                    : Container(),
              ),
            ),

            _SingIn(height: height),
          ],
        ),
      ),
    );
  }
}

class _SingIn extends StatelessWidget {
  const _SingIn({
    Key? key,
    required this.height,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      top: height * .6,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 36.0),
        width: double.infinity,     
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30.0),
            topLeft: Radius.circular(30.0),
          ),
        ),
        child: Column(
          
          children: [
            const SizedBox(
              height: 14.0,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "Username",
                hintStyle: const TextStyle(
                  fontSize: 14.0,
                  color: Colors.black45,
                ),
                filled: true,
                fillColor: const Color(0xffF5F5F5),
                contentPadding: const EdgeInsets.symmetric(
                    horizontal: 12.0, vertical: 14.0),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(
              height: 14.0,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "Password",
                hintStyle: const TextStyle(
                  fontSize: 14.0,
                  color: Colors.black45,
                ),
                filled: true,
                fillColor: const Color(0xffF5F5F5),
                contentPadding: const EdgeInsets.symmetric(
                    horizontal: 12.0, vertical: 14.0),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  "Forgot password?",
                ),
              ],
            ),
            const SizedBox(
              height: 14.0,
            ),
            SizedBox(
              height: 54.0,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {

                //  Navigator.push(context,MaterialPageRoute(builder: (context)=> const Challeng1Page()));

                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                ),
                child: const Text(
                  "Sign in",
                ),
              ),
            ),
            const SizedBox(
              height: 14.0,
            ),
          ],
        ),
      ),
    );
  }
}