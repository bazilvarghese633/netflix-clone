// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:netflix/application/models/model.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/colors/constants.dart';
import 'package:netflix/presentation/home/widgets/custom_button.dart';
import 'package:netflix/presentation/widgets/video_widget.dart';

class EveryOneWatchingWidget extends StatelessWidget {
  EveryOneWatchingWidget(
      {super.key,
      required this.movies,
      required this.index,
      required this.everyone});
  List movies;
  final int index;
  final Movie everyone;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        constantHeight,
        Text(everyone.title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )),
        constantHeight,
        Text(
          everyone.overview,
          style: const TextStyle(color: greyColor),
        ),
        constantHeight50,
        VideoWidget(
          image: movies[index].imagepath,
        ),
        constantHeight,
        const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomButton(
              icon: Icons.send,
              title: "Share",
              iconSize: 25,
              textSize: 16,
            ),
            constantWidth,
            CustomButton(
              icon: Icons.add,
              title: "My List",
              iconSize: 25,
              textSize: 16,
            ),
            constantWidth,
            CustomButton(
              icon: Icons.play_arrow,
              title: "Play",
              iconSize: 25,
              textSize: 16,
            ),
            constantWidth
          ],
        )
      ],
    );
  }
}