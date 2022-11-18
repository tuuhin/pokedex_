import 'package:flutter/material.dart';

class PokemonDetailsHeader extends SliverPersistentHeaderDelegate {
  final double height;

  PokemonDetailsHeader({required this.height});
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox();
  }

  @override
  double get maxExtent => height;

  @override
  double get minExtent => kTextTabBarHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
