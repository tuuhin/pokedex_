import 'dart:ui';

import 'package:flutter/material.dart';

class BlurryAppBar extends SliverPersistentHeaderDelegate {
  final String title;

  BlurryAppBar({required this.title});
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      title: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  @override
  double get maxExtent => kTextTabBarHeight;

  @override
  double get minExtent => 0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
