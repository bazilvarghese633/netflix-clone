import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/presentation/FastLaugh/fastlaugh_screen.dart';
import 'package:netflix/presentation/Search/search_screen.dart';
import 'package:netflix/presentation/downloads_page/widgets/download_page.dart';
import 'package:netflix/presentation/home/home_screen.dart';
import 'package:netflix/presentation/mainpage/widgest/bottom_nav.dart';
import 'package:netflix/presentation/new_and_hot/new_hot.dart';

class MainScreenPage extends StatefulWidget {
  const MainScreenPage({super.key});

  @override
  State<MainScreenPage> createState() => _MainScreenPageState();
}

class _MainScreenPageState extends State<MainScreenPage> {
  final _pages = [
    const HomeScreen(),
    const NewHotScreen(),
    const FastlaughScreen(),
    const SearchScreen(),
    const DownloadScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: ValueListenableBuilder(
        valueListenable: indexChangeNotifier,
        builder: (context, int index, _) {
          return _pages[index];
        },
      ),
      bottomNavigationBar: const BottomNavWidget(),
    );
  }
}
