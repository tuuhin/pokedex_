import '../models/models.dart';

abstract class PokemonSpeciesRepository {
  Future<PokemonSpeciesModel> getSpeciesDetials(int pokeId);
}
