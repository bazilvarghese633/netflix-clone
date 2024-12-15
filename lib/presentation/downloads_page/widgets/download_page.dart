import 'dart:math';

import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/colors/constants.dart';
import 'package:netflix/presentation/widgets/app_bar_widget.dart';

class DownloadScreen extends StatefulWidget {
  const DownloadScreen({super.key});

  @override
  State<DownloadScreen> createState() => _DownloadScreenState();
}

class _DownloadScreenState extends State<DownloadScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarWidget(
          title: 'Downloads',
        ),
      ),
      body: ListView(
        children: const [
          SizedBox(
            height: 20,
          ),
          smartDownloads(),
          Session2(),
          Session3(),
        ],
      ),
    );
  }
}

class smartDownloads extends StatelessWidget {
  const smartDownloads({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        SizedBox(
          width: 10,
        ),
        Icon(
          Icons.settings,
          color: whitecolor,
        ),
        kWidth,
        Text(
          'Smart Downloads',
          style: TextStyle(
              color: whitecolor, fontSize: 15, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}

class downloadsImageWidgets extends StatelessWidget {
  const downloadsImageWidgets(
      {super.key,
      required this.imageLists,
      this.angle = 0,
      required this.margin,
      required this.size});
  final double angle;
  final String imageLists;
  final EdgeInsets margin;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle * pi / 180,
      child: Container(
        margin: margin,
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: NetworkImage(imageLists),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class Session2 extends StatelessWidget {
  const Session2({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final List<String> imageLists = [
      'https://www.themoviedb.org/t/p/w1280/kV27j3Nz4d5z8u6mN3EJw9RiLg2.jpg',
      'https://www.themoviedb.org/t/p/w1280/BgcvtsVWLQfjHD6Dr3YYgeSLYk.jpg',
      'https://www.themoviedb.org/t/p/w1280/1XS1oqL89opfnbLl8WnZY1O1uJx.jpg',
    ];
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        const Text(
          'Indroducing Downloads for You',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: whitecolor, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        kheight,
        const Text(
          textAlign: TextAlign.center,
          "We'll download a personalised selection of\nmovies and shows for you ,so there's\nalways something to watch on your\ndevice",
          style: TextStyle(color: Colors.grey, fontSize: 16),
        ),
        kheight,
        SizedBox(
          height: size.width,
          width: size.width,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey.withOpacity(0.5),
                radius: size.width * 0.38,
              ),
              downloadsImageWidgets(
                imageLists: imageLists[2],
                margin: const EdgeInsets.only(left: 180, bottom: 40),
                angle: 17,
                size: Size(size.width * 0.4, size.width * 0.50),
              ),
              downloadsImageWidgets(
                imageLists: imageLists[1],
                margin: const EdgeInsets.only(right: 180, bottom: 40),
                size: Size(size.width * 0.4, size.width * 0.50),
                angle: -17,
              ),
              downloadsImageWidgets(
                imageLists: imageLists[0],
                margin: const EdgeInsets.only(bottom: 10),
                size: Size(size.width * 0.4, size.width * 0.58),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Session3 extends StatelessWidget {
  const Session3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(50),
              backgroundColor: kButtonColorBlue,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
            child: const Text(
              'Set up',
              style: TextStyle(
                color: kButtonColorWhite,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25, right: 25, top: 15),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(50),
              backgroundColor: kButtonColorWhite,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
            child: const Text(
              'See what you can download',
              style: TextStyle(
                color: kBlackColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        )
      ],
    );
  }
}
