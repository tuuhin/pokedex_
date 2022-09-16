import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/widget/spinner.dart';
import '../context/providers.dart';
import './routes/show_poke_news.dart';

import './widgets/poke_news_summary_card.dart';

class PokeDexNews extends StatefulWidget {
  const PokeDexNews({Key? key}) : super(key: key);

  @override
  State<PokeDexNews> createState() => _PokeDexNewsState();
}

class _PokeDexNewsState extends State<PokeDexNews> {
  void _viewMoreNews() => Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => const ShowPokeNews()));

  int _colCount(BoxConstraints constraints) {
    if (constraints.maxWidth < 600) {
      return 1;
    }
    if (constraints.minWidth > 600) {
      return 2;
    }
    if (constraints.minWidth > 768) {
      return 3;
    }
    return 4;
  }

  double _childAsceptRation(BoxConstraints constraints) {
    if (constraints.maxWidth < 600) {
      return 3;
    }
    if (constraints.minWidth > 600) {
      return 2;
    }
    return 1;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text('Pokemon News',
              style: Theme.of(context).textTheme.headline6),
          trailing: TextButton(
              onPressed: _viewMoreNews, child: const Text('View More')),
        ),
        Expanded(
          child: LayoutBuilder(builder: (context, constrains) {
            final colums = _colCount(constrains);
            final aspectRatio = _childAsceptRation(constrains);
            return Consumer(
              builder: (context, ref, child) =>
                  ref.watch(pokeNewsProvider).when(
                        data: (data) => GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio: aspectRatio,
                                  crossAxisCount: colums),
                          itemCount: data.length,
                          itemBuilder: (context, idx) =>
                              PokeNewsSummary(news: data[idx]),
                        ),
                        error: (err, stk) => Center(child: Text('err $err')),
                        loading: () => const Center(
                          child: Spinner(),
                        ),
                      ),
            );
          }),
        ),
      ],
    );
  }
}
