import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/colors/constants.dart';
import 'package:netflix/presentation/Search/widgets/title.dart';

const imageUrl =
    "https://media.themoviedb.org/t/p/w1066_and_h600_bestv2/jlbUx0aHJupDVDlCo0R7UxSaUUd.jpg";

class SearchIdelWidget extends StatelessWidget {
  const SearchIdelWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchtitleText(
          title: "Top Searches",
        ),
        kheight,
        Expanded(
          child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: (ctx, index) => TopSearchItemTile(),
            separatorBuilder: (ctx, index) => kheight20,
            itemCount: 10,
          ),
        )
      ],
    );
  }
}

class TopSearchItemTile extends StatelessWidget {
  TopSearchItemTile({super.key});
  @override
  Widget build(BuildContext context) {
    final ScreenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: ScreenWidth * 0.35,
          height: 65,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(imageUrl),
            ),
          ),
        ),
        kWidth,
        const Expanded(
          child: Text(
            'Movie Name',
            style: TextStyle(
                color: whitecolor, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        const CircleAvatar(
          backgroundColor: whitecolor,
          radius: 25,
          child: CircleAvatar(
            backgroundColor: Colors.black,
            radius: 23,
            child: Icon(
              CupertinoIcons.play,
              color: whitecolor,
            ),
          ),
        )
      ],
    );
  }
}
