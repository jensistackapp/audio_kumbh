import 'package:audio_kumbh/Wigetes/app_bottomnavigation.dart';
import 'package:audio_kumbh/Wigetes/app_custumappbar.dart';
import 'package:audio_kumbh/Wigetes/app_text.dart';
import 'package:flutter/material.dart';

class AppContainer extends StatelessWidget {
  const AppContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: CustumAppbar(),
      ),
      body: Center(child: AppText(text: "--------->")),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}
