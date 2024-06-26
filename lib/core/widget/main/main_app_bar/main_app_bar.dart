import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    required this.flexibleSpace,
    required this.heightAppBar,
  }) : super(key: key);

  final Widget flexibleSpace;
  final double heightAppBar;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          flexibleSpace: flexibleSpace,
          elevation: 0,
          expandedHeight: heightAppBar,
          pinned: true,
          floating: true,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(heightAppBar);
}
