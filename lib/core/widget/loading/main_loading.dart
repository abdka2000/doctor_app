import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainLoadignWidget extends StatelessWidget {
  const MainLoadignWidget({super.key, this.height});
  final double? height;
  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return SizedBox(
        height: height,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      return SizedBox(
        height: height,
        child: const Center(
          child: CupertinoActivityIndicator(),
        ),
      );
    }
  }
}
