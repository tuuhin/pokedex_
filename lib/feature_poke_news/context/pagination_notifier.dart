import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_pokedex/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/paginator/paginator.dart';
import '../domain/domain.dart';

class PaginatedPokemonNewsNotifier
    extends StateNotifier<Paginator<List<PokemonNewsModel>>> {
  PaginatedPokemonNewsNotifier(this._impl) : super(Paginator.loading());

  final PokemonNewsRepostiory _impl;
  int _offset = 0;
  bool _isEnd = false;
  bool _allowRequest = true;

  int get countItem => _items.length;

  final List<PokemonNewsModel> _items = [];

  final GlobalKey<SliverAnimatedListState> _key =
      GlobalKey<SliverAnimatedListState>();

  GlobalKey<SliverAnimatedListState> get newsStateKey => _key;

  void init() => _items.isEmpty ? _fetchSomePokeNews() : _fetchMorePokeNews();

  void requestNews() => _fetchMorePokeNews();

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
        await Future.delayed(const Duration(milliseconds: 600), () {
          logger.fine("message adding ${_items.indexOf(pokeNews)}");
          _key.currentState?.insertItem(_items.indexOf(pokeNews));
          // return null;
        });
      }
      _allowRequest = true;

      _offset += news.length;
    } catch (e, stk) {
      state = Paginator.error(e, stk);
    }
  }

  Future<void> _fetchMorePokeNews() async {
    if (!_allowRequest && !_isEnd) return;
    logger.shout("Requesting PokemonNews offset:$_offset ");
    try {
      state = Paginator.loadMore(_items);
      _allowRequest = false;
      List<PokemonNewsModel> news =
          await _impl.getNews(index: _offset, count: 5);

      if (news.isEmpty) {
        _isEnd = true;
        state = Paginator.end("No more data to load", _items);
        return;
      }
      state = Paginator.data(_items..addAll(news));

      for (final PokemonNewsModel pokeNews in news) {
        await Future.delayed(const Duration(milliseconds: 400), () {
          logger.fine("message adding ${_items.indexOf(pokeNews)}");
          _key.currentState?.insertItem(_items.indexOf(pokeNews));
          // return null;
        });
      }
      _allowRequest = true;

      _offset += news.length;
    } catch (e, stk) {
      state = Paginator.errorLoadMore(_items, e, stk);
    }
  }
}
