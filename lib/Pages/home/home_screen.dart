import 'package:audio_kumbh/Pages/home/home_screen_view.dart';
import 'package:audio_kumbh/Wigetes/app_bottomnavigation.dart';
import 'package:audio_kumbh/Wigetes/app_container.dart';
import 'package:audio_kumbh/Wigetes/app_custumappbar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);



  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BottomNavigation.pages[BottomNavigation.currentIndex],

    );
  }
}
