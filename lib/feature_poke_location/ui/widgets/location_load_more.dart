import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/widget/core_widgets.dart';
import '../../context/provider.dart';

class LocationLoadMore extends ConsumerWidget {
  const LocationLoadMore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) =>
      ref.watch(locationsProvider).maybeWhen(
          orElse: () => const SliverToBoxAdapter(child: SizedBox.shrink()),
          loadMore: (data) => const SliverToBoxAdapter(
              child: LoadMoreWidget(message: "Fetching More Ability")),
          errorLoadMore: (data, err, stk) =>
              const SliverToBoxAdapter(child: LoadMoreErrorWidget()),
          end: (message, data) =>
              SliverToBoxAdapter(child: EndOfListWidget(text: message)));
}
