import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/colors/constants.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 28),
      child: Row(
        children: [
          kWidth,
          Text(
            title,
            style: GoogleFonts.montserrat(
                fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          const Icon(
            Icons.cast,
            color: whitecolor,
            size: 30,
          ),
          kWidth,
          Container(
            width: 30,
            height: 30,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                    'https://pbs.twimg.com/media/GB2vydcX0AAgt5f?format=png&name=360x360',
                  ),
                  fit: BoxFit.cover),
            ),
          ),
          kWidth,
        ],
      ),
    );
  }
}
