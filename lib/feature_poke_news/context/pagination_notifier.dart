import 'package:flutter/material.dart';
import 'package:flutter_pokedex/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/paginator/paginator.dart';
import '../data/news_data.dart';

class PaginatedPokemonNewsNotifier
    extends StateNotifier<Paginator<List<PokeNewsDto>>> {
  PaginatedPokemonNewsNotifier(this._clt) : super(Paginator.loading());

  final PokeNewsApiClient _clt;
  int _offset = 0;
  final List<PokeNewsDto> _items = [];

  final GlobalKey<SliverAnimatedListState> _key =
      GlobalKey<SliverAnimatedListState>();

  GlobalKey<SliverAnimatedListState> get newsStateKey => _key;

  void init() {
    if (_items.isEmpty) {
      fetchMorePokeNews();
    }
    fetchMorePokeNews();
  }

  void fetchPokeNewsInital() async {
    try {
      state = Paginator.loading();
      List<PokeNewsDto> news = await _clt.getNews(index: 0);
      state = Paginator.data(_items..addAll(news));
      _offset += news.length;
      for (final PokeNewsDto item in news) {
        _key.currentState?.insertItem(news.indexOf(item));
      }
    } catch (e, stk) {
      state = Paginator.error(e, stk);
    }
  }

  void fetchMorePokeNews() async {
    logger.shout("Updaing the pair");
    try {
      state = Paginator.loadMore(_items);
      List<PokeNewsDto> news = await _clt.getNews(index: _offset);
      state = Paginator.data(_items..addAll(news));
      _offset += news.length;
    } catch (e, stk) {
      state = Paginator.errorLoadMore(_items, e, stk);
    }
  }
}
