import 'package:flutter/material.dart';
import 'package:flutter_pokedex/core/widget/core_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../context/providers.dart';
import '../../../../domain/models/models.dart';
import '../widgets/animated_stats_bar.dart';

class PokemonStatsTab extends ConsumerWidget {
  final int pokeId;
  const PokemonStatsTab({Key? key, required this.pokeId}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) =>
      ref.watch(currentSelectedPokemon(pokeId)).when(
          data: (data) {
            return ListView(
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(8.0),
              children: [
                const Text("Base Stats",
                    style: TextStyle(fontWeight: FontWeight.w600)),
                const SizedBox(height: 10),
                ...data.stats
                    .map(
                      (e) => AnimatedStatsBar(
                          limit: 100,
                          statsModel: e,
                          progressbarColor: e.baseStat > 50
                              ? Colors.blueAccent
                              : Colors.redAccent),
                    )
                    .toList(),
                AnimatedStatsBar(
                  statsModel: data.stats.fold<BaseStatsModel>(
                      BaseStatsModel(name: "Total", baseStat: 0, effort: 0),
                      (previousValue, element) => previousValue.copyWith(
                          baseStat: previousValue.baseStat + element.baseStat,
                          effort: previousValue.effort + element.effort)),
                  progressbarColor: Colors.red,
                  limit: data.stats.length * 100,
                ),
                const Divider(),
                const Text("Base Experience",
                    style: TextStyle(fontWeight: FontWeight.w600)),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Text('Experience',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.w600)),
                    const SizedBox(width: 35),
                    Text(data.baseXP?.toString() ?? 'Unknown')
                  ],
                )
              ],
            );
          },
          error: (Object error, StackTrace stackTrace) {
            return PaginatorErrorWidget();
          },
          loading: () => CircularProgressIndicator());
}
