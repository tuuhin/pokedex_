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
          itemBuilder: (context, index, animation) => SizeTransition(
              sizeFactor: animation, child: LocationCard(model: data[index])),
        ),
      );
}
