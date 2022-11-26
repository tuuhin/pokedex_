import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/widget/core_widgets.dart';
import '../../context/provider.dart';
import 'widgets.dart';

class TypeChartsLoader extends ConsumerWidget {
  const TypeChartsLoader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => SliverPadding(
        padding: const EdgeInsets.all(8.0),
        sliver: ref.watch(typeChartsProvider).when(
              loading: () => const SliverFillRemaining(
                  child: LoadingInfo(
                      text: "Fetching Types", color: Color(0xffb1736d))),
              loadMore: (data) => TypesList(data: data),
              data: (data) => TypesList(data: data),
              error: (err, stk) =>
                  const SliverFillRemaining(child: PaginatorErrorWidget()),
              errorLoadMore: (data, err, stk) => TypesList(data: data),
              end: (message, data) => TypesList(data: data),
            ),
      );
}
