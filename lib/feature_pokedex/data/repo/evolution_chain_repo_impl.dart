import '../../domain/models/evolution_chain_details_model.dart';
import '../../domain/repository/evolution_chain_repo.dart';
import '../remote/remote.dart';

class EvolutionChainRepoImpl implements EvolutionChainRepository {
  final PokedexClient _client;

  EvolutionChainRepoImpl(this._client);
  @override
  Future<EvolutionChainDetailedModel> getEvolutionDetials(int pokeId) async {
    EvolutionChainDetailsDto dto =
        await _client.getEvolutionChainDetailed(id: pokeId);
    return await dto.toModel();
  }
}
