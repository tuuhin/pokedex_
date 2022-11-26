import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/util/dio_client.dart';
import '../../core/util/paginator/paginator.dart';
import '../data/remote/pokemon_ability_client.dart';
import '../data/repository/pokemon_ability_repo_impl.dart';
import '../domain/models/pokemon_ability_model.dart';
import '../domain/repository/pokemon_ability_repository.dart';
import './pokemon_ability_provider.dart';

final _apiClientProvider =
    Provider<PokemonAbilityClient>((ref) => PokemonAbilityClient(dio));

final _abilityRepositoryProvider = Provider<PokemonAbilityRespository>(
    (ref) => PokemonAbilityRepositoryImpl(ref.read(_apiClientProvider)));

final pokemonAbilityProvider = StateNotifierProvider<PokemonAbilityNotifier,
        Paginator<List<PokemonAbility>>>(
    (ref) =>
        PokemonAbilityNotifier(ref.read(_abilityRepositoryProvider))..init());
