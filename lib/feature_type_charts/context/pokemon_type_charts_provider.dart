import 'package:flutter/cupertino.dart';
import 'package:flutter_pokedex/core/util/utlis.dart';
import 'package:flutter_pokedex/feature_type_charts/domain/repository/pokemon_type_chats_repo.dart';
import 'package:flutter_pokedex/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/models/base_response_model.dart';
import '../../core/util/paginator/paginator.dart';
import '../domain/models/models.dart';

class PokemonTypeChartsNotifier
    extends StateNotifier<Paginator<List<PokemonTypeDetailedModel>>> {
  final PokemonTypeChartsRepostiory _repo;
  PokemonTypeChartsNotifier(this._repo) : super(Paginator.loading());

  int _offset = 0;
  List<PokemonTypeDetailedModel> _types = [];

  String? _nextURL;

  final GlobalKey<SliverAnimatedListState> _key =
      GlobalKey<SliverAnimatedListState>();

  GlobalKey<SliverAnimatedListState> get listKey => _key;

  void init() => _types.isEmpty ? fetchTypes() : fetchMoreTypes();

  void fetchTypes() async {
    try {
      PokemonBaseResponse response = await _repo.getBaseTypeInfo();
      if (response.next != null) {
        _offset = getIdFromString(response.next!) ?? _offset;
      }
      List<PokemonTypeDetailedModel> types =
          await _repo.getTypeDetailed(response.results);
      state = Paginator.data(_types..addAll(types));
      logger.fine("good");
    } catch (e, stk) {
      logger.shout("error");
      state = Paginator.error(e, stk);
    }
  }

  void fetchMoreTypes() async {
    try {
      if (_nextURL == null) {
        state = Paginator.end("No more types", _types);
        return;
      }
    } catch (e, stk) {
      state = Paginator.errorLoadMore(_types, e, stk);
    }
  }
}
