import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/models/models.dart';
import '../../core/util/paginator/paginator.dart';
import '../../core/util/string_helper.dart';
import '../domain/domain.dart';

class LocationNotifier extends StateNotifier<Paginator<List<LocationModel>>> {
  LocationNotifier(this._repo) : super(Paginator.loading());
  final LocationRepository _repo;

  final GlobalKey<SliverAnimatedListState> _key =
      GlobalKey<SliverAnimatedListState>();

  final List<LocationModel> _locations = [];

  GlobalKey<SliverAnimatedListState> get key => _key;

  int _offset = 0;

  String? _nextURL;

  int get count => _locations.length;

  Timer _limiter = Timer(const Duration(seconds: 2), () {});

  void init() => _locations.isEmpty ? _fetchSomeItems() : _fetchMoreItems();

  void fetchMore() => _fetchMoreItems();

  void refresh() => _fetchSomeItems();

  void _fetchSomeItems() async {
    try {
      PokemonBaseResponse base = await _repo.getLocation();
      _nextURL = base.next;
      if (_nextURL != null) {
        _offset = getOffsetFromString(_nextURL!) ?? 1;
      }
      List<LocationModel> items = await _repo.getLocationsInfo(base.results);

      state = Paginator.data(_locations..addAll(items));

      for (final LocationModel it in items) {
        await Future.delayed(
          const Duration(milliseconds: 400),
          () => _key.currentState?.insertItem(
            _locations.indexOf(it),
          ),
        );
      }
    } catch (e, stk) {
      debugPrintStack(stackTrace: stk);
    }
  }

  void _fetchMoreItems() async {
    if (_nextURL == null) {
      state = Paginator.end("No more regions present", _locations);
      return;
    }
    if (_limiter.isActive) return;
    _limiter = Timer(const Duration(seconds: 2), () {});
    try {
      state = Paginator.loadMore(_locations);
      PokemonBaseResponse base =
          await _repo.getLocation(offset: _offset, limit: 5);

      _nextURL = base.next;
      if (_nextURL != null) {
        int newOffset = getOffsetFromString(_nextURL!) ?? _offset;
        if (newOffset > _offset) {
          _offset = newOffset;
        } else {
          state = Paginator.end("The end", _locations);
          return;
        }
      }

      List<LocationModel> items = await _repo.getLocationsInfo(base.results);

      state = Paginator.data(_locations..addAll(items));

      for (final LocationModel it in items) {
        await Future.delayed(
          const Duration(milliseconds: 400),
          () => _key.currentState?.insertItem(
            _locations.indexOf(it),
          ),
        );
      }
    } catch (e, stk) {
      debugPrintStack(stackTrace: stk);
      state = Paginator.errorLoadMore(_locations, e, stk);
    }
  }
}
