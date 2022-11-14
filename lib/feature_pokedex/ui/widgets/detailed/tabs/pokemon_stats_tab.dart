import 'package:flutter/material.dart';
import '../../../../domain/models/models.dart';
import '../widgets/animated_stats_bar.dart';

class PokemonStatsTab extends StatelessWidget {
  final List<BaseStatsModel> stats;
  const PokemonStatsTab({Key? key, required this.stats}) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Base Stats",
                style: TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(height: 10),
            ...stats
                .map(
                  (e) => AnimatedStatsBar(
                    limit: 100,
                    statsModel: e,
                    progressbarColor:
                        e.baseStat > 50 ? Colors.blueAccent : Colors.redAccent,
                  ),
                )
                .toList(),
            AnimatedStatsBar(
                statsModel: stats.fold<BaseStatsModel>(
                    BaseStatsModel(name: "Total", baseStat: 0, effort: 0),
                    (previousValue, element) => previousValue.copyWith(
                        baseStat: previousValue.baseStat + element.baseStat,
                        effort: previousValue.effort + element.effort)),
                progressbarColor: Colors.red,
                limit: stats.length * 100)
          ],
        ),
      );
}
