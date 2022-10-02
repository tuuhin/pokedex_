import 'dart:async';

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
  bool isEnd = false;

  int get countItem => _items.length;

  final List<PokeNewsDto> _items = [];

  Timer _timer = Timer(const Duration(seconds: 0), () {});

  final GlobalKey<SliverAnimatedListState> _key =
      GlobalKey<SliverAnimatedListState>();

  GlobalKey<SliverAnimatedListState> get newsStateKey => _key;

  void init() => _items.isEmpty ? fetchSomePokeNews() : fetchMorePokeNews();

  void fetchSomePokeNews() async {
    logger.shout("Requesting Some PokemonNews");
    try {
      state = Paginator.loading();
      List<PokeNewsDto> news = await _clt.getNews();

      if (news.isEmpty) {
        isEnd = true;
        state = Paginator.end("No more data to load");
        return;
      }
      state = Paginator.data(_items..addAll(news));
      for (final PokeNewsDto pokeNews in news) {
        await Future.delayed(const Duration(milliseconds: 600), () {
          logger.fine("message adding ${_items.indexOf(pokeNews)}");
          _key.currentState?.insertItem(_items.indexOf(pokeNews));
          // return null;
        });
      }

      _offset += news.length;
    } catch (e, stk) {
      state = Paginator.error(e, stk);
    }
  }

  void fetchMorePokeNews() async {
    if (_timer.isActive && !isEnd) return;
    _timer = Timer(const Duration(seconds: 1), () {});
    logger.shout("Requesting PokemonNews $_offset");
    try {
      state = Paginator.loadMore(_items);
      List<PokeNewsDto> news = await _clt.getNews(index: _offset);

      if (news.isEmpty) {
        isEnd = true;
        state = Paginator.end("No more data to load");
        return;
      }
      state = Paginator.data(_items..addAll(news));

      for (final PokeNewsDto pokeNews in news) {
        await Future.delayed(const Duration(milliseconds: 600), () {
          logger.fine("message adding ${_items.indexOf(pokeNews)}");
          _key.currentState?.insertItem(_items.indexOf(pokeNews));
          // return null;
        });
      }

      _offset += news.length;
    } catch (e, stk) {
      state = Paginator.errorLoadMore(_items, e, stk);
    }
  }
}
