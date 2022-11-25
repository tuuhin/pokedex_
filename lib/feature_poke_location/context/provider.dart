import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/util/dio_client.dart';
import '../../core/util/paginator/paginator.dart';
import '../data/remote/pokemon_location_api.dart';
import '../data/repository/location_repo_impl.dart';
import '../domain/domain.dart';
import 'location_provider.dart';

final locationClientProvider =
    Provider<PokemonLocationApi>((ref) => PokemonLocationApi(dio));

final _locationRepoProvider = Provider<LocationRepository>(
  (ref) => LocationRepoImpl(
    ref.read(locationClientProvider),
  ),
);

final locationsProvider =
    StateNotifierProvider<LocationNotifier, Paginator<List<LocationModel>>>(
  (ref) => LocationNotifier(ref.read(_locationRepoProvider))..init(),
);
