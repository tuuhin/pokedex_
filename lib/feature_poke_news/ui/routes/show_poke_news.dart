import 'package:flutter/material.dart';
import 'package:flutter_pokedex/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../data/dto/pokenews_dto.dart';
import '../context/pokenews_provider.dart';
import '../widgets/pokedex_news_widget.dart';

class ShowPokeNews extends StatefulWidget {
  const ShowPokeNews({Key? key}) : super(key: key);

  @override
  State<ShowPokeNews> createState() => _ShowPokeNewsState();
}

class _ShowPokeNewsState extends State<ShowPokeNews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Consumer(
          builder: (context, ref, child) {
            AsyncValue<List<PokeNewsDto>> pokenews =
                ref.watch(pokeNewsProvider);
            return pokenews.when(
                data: (data) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (context, idx) =>
                              PokeNewsDetailedCard(news: data[idx])),
                    ),
                error: (error, stackTrace) => Text('no '),
                loading: () =>
                    const Center(child: CircularProgressIndicator()));
          },
        ));
  }
}
