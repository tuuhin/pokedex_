import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../main.dart';
import '../../core/util/paginator/paginator.dart';
import '../domain/domain.dart';

class PokemonNewsNotifier
    extends StateNotifier<Paginator<List<PokemonNewsModel>>> {
  PokemonNewsNotifier(this._impl) : super(Paginator.loading());

  final PokemonNewsRepostiory _impl;

  int _offset = 0;
  bool _isEnd = false;
  Timer _limiter = Timer(const Duration(milliseconds: 4000), () {});

  int get countItem => _items.length;

  final List<PokemonNewsModel> _items = [];

  final GlobalKey<SliverAnimatedListState> _key =
      GlobalKey<SliverAnimatedListState>();

  GlobalKey<SliverAnimatedListState> get newsStateKey => _key;

  void init() => _items.isEmpty ? _fetchSomePokeNews() : _fetchMorePokeNews();

  void requestNews() => _fetchMorePokeNews();

  void refresh() {
    state = Paginator.loading();
    _fetchSomePokeNews();
  }

  Future<void> _fetchSomePokeNews() async {
    logger.shout("Requesting Some PokemonNews");
    try {
      state = Paginator.loading();
      List<PokemonNewsModel> news = await _impl.getNews(count: 10);

      if (news.isEmpty) {
        _isEnd = true;
        state = Paginator.end("No more data to load", _items);
        return;
      }
      state = Paginator.data(_items..addAll(news));
      for (final PokemonNewsModel pokeNews in news) {
        await Future.delayed(const Duration(milliseconds: 600),
            () => _key.currentState?.insertItem(_items.indexOf(pokeNews)));
      }

      _offset += news.length;
    } catch (e, stk) {
      state = Paginator.error(e, stk);
    }
  }

  Future<void> _fetchMorePokeNews() async {
    if (_isEnd) {
      state = Paginator.end("No more news to Load", _items);
      return;
    }
    if (_limiter.isActive) return;
    _limiter = Timer(const Duration(seconds: 2), () {});
    logger.shout("Requesting PokemonNews offset:$_offset ");
    state = Paginator.loadMore(_items);
    try {
      List<PokemonNewsModel> news =
          await _impl.getNews(index: _offset, count: 5);

      if (news.isEmpty) {
        _isEnd = true;
        state = Paginator.end("No more data to load", _items);
        return;
      }
      state = Paginator.data(_items..addAll(news));

      for (final PokemonNewsModel pokeNews in news) {
        await Future.delayed(const Duration(milliseconds: 400),
            () => _key.currentState?.insertItem(_items.indexOf(pokeNews)));
      }
      _offset += news.length;
    } catch (e, stk) {
      state = Paginator.errorLoadMore(_items, e, stk);
    }
  }
}
