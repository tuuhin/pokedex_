import '../models/models.dart';

abstract class EvolutionChainRepository {
  Future<EvolutionChainDetailedModel> getEvolutionDetials(int pokeId);
}
