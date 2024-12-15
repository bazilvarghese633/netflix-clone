import 'package:flutter/material.dart';

class VideoListWidget extends StatelessWidget {
  final int index;
  const VideoListWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.accents[index % Colors.accents.length],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //left side
                CircleAvatar(
                  radius: 30,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.volume_mute),
                  ),
                ),
                //right side
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CircleAvatar(),
                    CircleAvatar(),
                    CircleAvatar(),
                    CircleAvatar(),
                    CircleAvatar(),
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
