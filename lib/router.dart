import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

import 'app/app.dart';
import 'feature_poke_ability/ui/pokemon_ability.dart';
import 'feature_poke_item/ui/pokeomn_items.dart';
import 'feature_poke_location/ui/pokeomn_locations.dart';
import 'feature_poke_moves/ui/pokemon_moves.dart';
import 'feature_poke_news/ui/routes/show_poke_news.dart';
import 'feature_pokedex/ui/pokedex_base.dart';
import 'feature_type_charts/ui/pokemon_type_charts.dart';

final GoRouter router = GoRouter(
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) => const App(),
    ),
    GoRoute(
      path: '/pokedex',
      builder: (BuildContext context, GoRouterState state) =>
          const PokedexBaseRoute(),
    ),
    GoRoute(
      path: '/type',
      builder: (BuildContext context, GoRouterState state) =>
          const PokemonTypeCharts(),
    ),
    GoRoute(
      path: '/news',
      builder: (BuildContext context, GoRouterState state) =>
          const ShowPokeNews(),
    ),
    GoRoute(
      path: '/moves',
      builder: (BuildContext context, GoRouterState state) =>
          const PokeMonMoves(),
    ),
    GoRoute(
      path: '/location',
      builder: (BuildContext context, GoRouterState state) =>
          const PokemonLocations(),
    ),
    GoRoute(
      path: '/item',
      builder: (BuildContext context, GoRouterState state) =>
          const PokemonItems(),
    ),
    GoRoute(
      path: '/ability',
      builder: (BuildContext context, GoRouterState state) =>
          const PokemonAbilityPage(),
    )
  ],
);
