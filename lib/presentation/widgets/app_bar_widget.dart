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
            color: Colors.blue,
          ),
          kWidth,
        ],
      ),
    );
  }
}
