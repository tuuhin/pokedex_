import 'package:flutter/material.dart';
import 'package:flutter_pokedex/feature_poke_news/data/dto/pokenews_dto.dart';
import 'package:flutter_pokedex/feature_poke_news/ui/context/pokenews_provider.dart';
import 'package:flutter_pokedex/feature_poke_news/ui/routes/show_poke_news.dart';
import 'package:flutter_pokedex/feature_poke_news/ui/widgets/poke_news_summary_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PokeDexNews extends StatefulWidget {
  const PokeDexNews({super.key});

  @override
  State<PokeDexNews> createState() => _PokeDexNewsState();
}

class _PokeDexNewsState extends State<PokeDexNews> {
  void viewMoreNews() => Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => const ShowPokeNews()));

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text('Pokemon News',
              style: Theme.of(context).textTheme.headline6),
          trailing: TextButton(
              onPressed: viewMoreNews, child: const Text('View More')),
        ),
        Consumer(
          builder: (context, ref, child) {
            AsyncValue<List<PokeNewsDto>> pokenews =
                ref.watch(pokeNewsProvider);
            return pokenews.when(
                data: (data) => Expanded(
                      child: ListView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          itemCount: data.length,
                          itemBuilder: (context, idx) {
                            return PokeNewsSummary(news: data[idx]);
                          }),
                    ),
                error: (err, stack) => const Text('faild'),
                loading: () => const CircularProgressIndicator());
          },
        )
      ],
    );
  }
}
