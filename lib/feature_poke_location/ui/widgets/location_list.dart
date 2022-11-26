import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../context/provider.dart';
import '../../domain/domain.dart';
import 'widgets.dart';

class LocationList extends StatelessWidget {
  final List<LocationModel> data;
  const LocationList({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) => Consumer(
        builder: (context, ref, _) => SliverAnimatedList(
          key: ref.read(locationsProvider.notifier).key,
          itemBuilder: (context, index, animation) {
            final Animation<double> _opacity = Tween<double>(begin: 0.1, end: 1)
                .animate(
                    CurvedAnimation(parent: animation, curve: Curves.easeIn));
            final Animation<Offset> _offset = Tween<Offset>(
                    begin: const Offset(0, 1), end: Offset.zero)
                .animate(
                    CurvedAnimation(parent: animation, curve: Curves.easeIn));
            return SlideTransition(
              position: _offset,
              child: FadeTransition(
                  opacity: _opacity, child: LocationCard(model: data[index])),
            );
          },
        ),
      );
}
