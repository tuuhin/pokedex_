import 'package:flutter_pokedex/feature_pokedex/data/remote/dto/pokemon_species_dto.dart';

import '../../domain/models/models.dart';
import '../../domain/repository/pokemon_species_repo.dart';
import '../remote/pokedex_client.dart';

class PokemonSpeciesRepoImpl implements PokemonSpeciesRepository {
  final PokedexClient _client;

  PokemonSpeciesRepoImpl(this._client);
  @override
  Future<PokemonSpeciesModel> getSpeciesDetials(int pokeId) async {
    PokemonSpeciesDto dto = await _client.getSpeciesDetailed(id: pokeId);
    return dto.toModel();
  }
}
