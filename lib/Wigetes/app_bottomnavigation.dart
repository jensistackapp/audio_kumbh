import 'package:audio_kumbh/Pages/home/home_screen.dart';
import 'package:audio_kumbh/Pages/home/home_screen_view.dart';
import 'package:audio_kumbh/Wigetes/app_container.dart';
import 'package:audio_kumbh/Wigetes/app_text.dart';
import 'package:audio_kumbh/constant/assets_constant.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  static List pages = [
    const HomeScreenView(),
    const AppContainer(),
    const AppContainer(),
    const AppContainer()
  ];
  static int currentIndex = 0;

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

Color tempColor = Colors.brown;
bool temp = false;

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          onPressed: () {
            setState(() {
              BottomNavigation.currentIndex = 0;
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const HomeScreenView();
                },
              ));
            });
          },
          icon: Image.asset(
            AssetsConstant.books,
            color:
                BottomNavigation.currentIndex == 0 ? const Color(0xFF512A00) : Colors.grey,
          ),
        ),
        IconButton(
          onPressed: () {
            BottomNavigation.currentIndex = 1;
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return const AppContainer();
              },
            ));
            setState(() {});
          },
          icon: Image.asset(
            AssetsConstant.prodcast,
            color:
                BottomNavigation.currentIndex == 1 ? const Color(0xFF512A00) : Colors.grey,
          ),
        ),
        Baseline(
          baseline: 10,
          baselineType: TextBaseline.alphabetic,
          child: Container(
              height: 10.h,
              width: 20.w,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AssetsConstant.round),
                ),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.currency_rupee_sharp, color: Colors.white),
                  AppText(
                    text: "Donate",
                    color: Colors.white,
                    fontSize: 10,
                  ),
                ],
              )),
        ),
        IconButton(
          onPressed: () {
            BottomNavigation.currentIndex = 2;
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return const AppContainer();
              },
            ));

            setState(() {});
          },
          icon: Image.asset(
            AssetsConstant.music,
            color:
                BottomNavigation.currentIndex == 2 ? const Color(0xFF512A00) : Colors.grey,
          ),
        ),
        IconButton(
          onPressed: () {
            BottomNavigation.currentIndex = 3;

            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return const AppContainer();
              },
            ));
            setState(() {});
          },
          icon: Image.asset(
            AssetsConstant.library,
            color:
                BottomNavigation.currentIndex == 3 ? const Color(0xFF512A00): Colors.grey,
          ),
        ),
      ],
    );
  }
}
