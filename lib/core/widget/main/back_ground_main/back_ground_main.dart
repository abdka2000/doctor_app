import 'package:flutter/material.dart';
import '../nav_button_main/nav_button_main.dart';

class MainBackGround extends StatelessWidget {
  const MainBackGround({
    super.key,
    required this.mainBody,
    this.appBar,
  });
  final Widget mainBody;
  final PreferredSizeWidget? appBar;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      bottomNavigationBar: const MainButtonNavigation(),
      body: SafeArea(
        child: mainBody,
      ),
    );
  }
}
