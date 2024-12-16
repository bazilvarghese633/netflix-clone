// import 'package:flutter/material.dart';

// class VideoListWidget extends StatelessWidget {
//   final int index;
//   const VideoListWidget({super.key, required this.index});

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Container(
//           color: Colors.accents[index % Colors.accents.length],
//         ),
//         Align(
//           alignment: Alignment.bottomCenter,
//           child: Padding(
//             padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.end,
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 //left side
//                 CircleAvatar(
//                   radius: 30,
//                   child: IconButton(
//                     onPressed: () {},
//                     icon: Icon(Icons.volume_mute),
//                   ),
//                 ),
//                 //right side
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     CircleAvatar(),
//                     CircleAvatar(),
//                     CircleAvatar(),
//                     CircleAvatar(),
//                     CircleAvatar(),
//                   ],
//                 )
//               ],
//             ),
//           ),
//         )
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:video_player/video_player.dart';

class VideoListItemWidget extends StatefulWidget {
  final int index;
  final String videourl;
  const VideoListItemWidget(
      {super.key, required this.index, required this.videourl});

  @override
  State<VideoListItemWidget> createState() => _VideoListItemWidgetState();
}

class _VideoListItemWidgetState extends State<VideoListItemWidget> {
  late VideoPlayerController _videoPlayerController;
  bool isVolume = true;
  bool isPlay = true;

  @override
  void initState() {
    super.initState();
    videoController(videoPath: videoPathList[widget.index]);
  }

  void videoController({required String videoPath}) {
    _videoPlayerController = VideoPlayerController.network(videoPath);
    _videoPlayerController.initialize().then((_) {
      setState(() {
        _videoPlayerController.play();
        _videoPlayerController.setVolume(isVolume ? 1.0 : 0.0);
      });
    });
  }

  void toggleVolume() {
    setState(() {
      isVolume = !isVolume;
      _videoPlayerController.setVolume(isVolume ? 1.0 : 0.0);
    });
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _videoPlayerController.value.isInitialized
            ? Center(
                child: AspectRatio(
                  aspectRatio: _videoPlayerController.value.aspectRatio,
                  child: VideoPlayer(_videoPlayerController),
                ),
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // left side
                CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.black.withOpacity(0.5),
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.volume_off,
                          color: whitecolor,
                          size: 30,
                        ))),

                //right side

                const Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                            "https://www.themoviedb.org/t/p/w1280/kV27j3Nz4d5z8u6mN3EJw9RiLg2.jpg"),
                      ),
                    ),
                    VideoActionWidget(icon: Icons.emoji_emotions, title: 'LOL'),
                    VideoActionWidget(icon: Icons.add, title: 'My List'),
                    VideoActionWidget(icon: Icons.share, title: 'Share'),
                    VideoActionWidget(icon: Icons.play_arrow, title: 'Play'),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class VideoActionWidget extends StatelessWidget {
  final IconData icon;

  final String title;
  const VideoActionWidget({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 30,
          ),
          Text(
            title,
            style: const TextStyle(
              color: whitecolor,
              fontSize: 16,
            ),
          )
        ],
      ),
    );
  }
}

List<String> videoPathList = [
  'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerMeltdowns.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/Sintel.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/SubaruOutbackOnStreetAndDirt.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/TearsOfSteel.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/VolkswagenGTIReview.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/WeAreGoingOnBullrun.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/WhatCarCanYouGetForAGrand.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
];
