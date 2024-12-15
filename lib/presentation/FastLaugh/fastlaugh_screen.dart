import 'package:flutter/material.dart';
import 'package:netflix/core/colors/constants.dart';
import 'package:netflix/presentation/FastLaugh/widgets/video_list.dart';

class FastlaughScreen extends StatefulWidget {
  const FastlaughScreen({super.key});

  @override
  State<FastlaughScreen> createState() => _FastlaughScreenState();
}

class _FastlaughScreenState extends State<FastlaughScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: SafeArea(
          child: PageView(
            scrollDirection: Axis.vertical,
            children: List.generate(
              10,
              (index) {
                return VideoListWidget(index: index);
              },
            ),
          ),
        ),
      ),
    );
  }
}
