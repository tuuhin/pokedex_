import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/widget/spinner.dart';
import '../context/providers.dart';
import './routes/show_poke_news.dart';
import './widgets/summary/poke_news_summary_list.dart';

class PokeDexNews extends StatefulWidget {
  const PokeDexNews({Key? key}) : super(key: key);

  @override
  State<PokeDexNews> createState() => _PokeDexNewsState();
}

class _PokeDexNewsState extends State<PokeDexNews> {
  void _viewMoreNews() => Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => const ShowPokeNews()));

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text('Pokemon News',
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(fontWeight: FontWeight.w700)),
          trailing: TextButton(
              onPressed: _viewMoreNews,
              child: const Text(
                'View More',
                style: TextStyle(decoration: TextDecoration.underline),
              )),
        ),
        Expanded(
          child: Consumer(
            builder: (context, ref, child) => ref.watch(pokeNewsProvider).when(
                  data: (data) => Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: PokeNewsSummaryList(data: data),
                  ),
                  error: (err, stk) =>
                      const Center(child: Text('err happened')),
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
