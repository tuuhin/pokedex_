import 'package:flutter/material.dart';
import 'package:flutter_pokedex/core/widget/core_widgets.dart';
import 'package:flutter_pokedex/feature_poke_location/context/provider.dart';
import 'package:flutter_pokedex/feature_poke_location/ui/widgets/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LocationLoader extends ConsumerWidget {
  const LocationLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) =>
      ref.watch(locationsProvider).when(
          loading: () => const SliverFillRemaining(
                child: LoadingInfo(
                    text: "Fetching regions", color: Color(0xff7c528c)),
              ),
          loadMore: (data) => LocationList(data: data),
          data: (data) => LocationList(data: data),
          error: (err, stk) => const SliverFillRemaining(
                child: PaginatorErrorWidget(),
              ),
          errorLoadMore: (data, err, stk) => LocationList(data: data),
          end: (message, data) => LocationList(data: data));
}
