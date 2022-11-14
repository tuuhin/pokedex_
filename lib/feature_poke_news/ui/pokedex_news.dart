import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/widget/spinner.dart';
import '../context/providers.dart';
import 'widgets/widgets.dart';

class PokeDexNews extends StatefulWidget {
  const PokeDexNews({Key? key}) : super(key: key);

  @override
  State<PokeDexNews> createState() => _PokeDexNewsState();
}

class _PokeDexNewsState extends State<PokeDexNews> {
  void _viewMoreNews() => context.push('/news');

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('Pokemon News',
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(fontWeight: FontWeight.w700)),
            TextButton(
              onPressed: _viewMoreNews,
              child: Text('View More',
                  style: Theme.of(context).textTheme.button?.copyWith(
                        fontWeight: FontWeight.w500,
                      )),
            ),
          ],
        ),
        Expanded(
          child: Consumer(
            builder: (context, ref, child) => ref.watch(pokeNewsProvider).when(
                  data: (data) => PokeNewsSummaryList(data: data),
                  error: (err, stk) => PokemonNewsLoadFailed(
                    refresh: ref.read(pokeNewsProvider.notifier).tryAgain,
                  ),
                  loading: () => const Center(
                    child: Spinner(),
                  ),
                ),
          ),
        ),
      ],
    );
  }
}
