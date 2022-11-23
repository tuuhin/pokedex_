import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/models/base_response_model.dart';
import '../../core/util/paginator/paginator.dart';
import '../../core/util/string_helper.dart';
import '../domain/models/pokemon_item_model.dart';
import '../domain/repository/pokemon_item_repository.dart';

class PokemonItemNotifier
    extends StateNotifier<Paginator<List<PokemonItemModel>>> {
  PokemonItemNotifier(this._repo) : super(Paginator.loading());
  final PokemonItemRepository _repo;

  final GlobalKey<SliverAnimatedListState> _key =
      GlobalKey<SliverAnimatedListState>();

  final List<PokemonItemModel> _items = [];

  GlobalKey<SliverAnimatedListState> get key => _key;

  int _offset = 0;

  String? _nextURL;

  int get itemCount => _items.length;

  Timer _limiter = Timer(const Duration(seconds: 2), () {});

  void init() => _items.isEmpty ? _fetchSomeItems() : _fetchMoreItems();

  void fetchMore() => _fetchMoreItems();

  void refresh() => _fetchSomeItems();

  void _fetchSomeItems() async {
    try {
      PokemonBaseResponse base = await _repo.getItems();
      _nextURL = base.next;
      if (_nextURL != null) {
        _offset = getOffsetFromString(_nextURL!) ?? 1;
      }
      List<PokemonItemModel> items = await _repo.getItemsDetails(base.results);

      state = Paginator.data(_items..addAll(items));

      for (final PokemonItemModel it in items) {
        await Future.delayed(
          const Duration(milliseconds: 400),
          () => _key.currentState?.insertItem(
            _items.indexOf(it),
          ),
        );
      }
    } catch (e, stk) {
      debugPrintStack(stackTrace: stk);
    }
  }

  void _fetchMoreItems() async {
    if (_nextURL == null) {
      state = Paginator.end("The end", _items);
      return;
    }
    if (_limiter.isActive) return;
    _limiter = Timer(const Duration(seconds: 2), () {});
    try {
      state = Paginator.loadMore(_items);
      PokemonBaseResponse base =
          await _repo.getItems(offset: _offset, limit: 5);

      _nextURL = base.next;
      if (_nextURL != null) {
        int newOffset = getOffsetFromString(_nextURL!) ?? _offset;
        if (newOffset > _offset) {
          _offset = newOffset;
        } else {
          state = Paginator.end("The end", _items);
          return;
        }
      }

      List<PokemonItemModel> items = await _repo.getItemsDetails(base.results);

      state = Paginator.data(_items..addAll(items));

      for (final PokemonItemModel it in items) {
        await Future.delayed(
          const Duration(milliseconds: 400),
          () => _key.currentState?.insertItem(
            _items.indexOf(it),
          ),
        );
      }
    } catch (e, stk) {
      debugPrintStack(stackTrace: stk);
      state = Paginator.errorLoadMore(_items, e, stk);
    }
  }
}
