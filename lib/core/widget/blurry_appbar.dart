import 'dart:ui';

import 'package:flutter/material.dart';

class BlurryAppBar extends SliverPersistentHeaderDelegate {
  final String title;

  BlurryAppBar({required this.title});
  @override
  Widget build(
          BuildContext context, double shrinkOffset, bool overlapsContent) =>
      AppBar(
        automaticallyImplyLeading: false,
        title: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 200),
            opacity: 1 - (shrinkOffset / maxExtent),
            child: Text(title,
                style: const TextStyle(fontWeight: FontWeight.w600)),
          ),
        ),
      );

  @override
  double get maxExtent => kTextTabBarHeight;

  @override
  double get minExtent => kTextTabBarHeight * .5;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
