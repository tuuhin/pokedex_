import 'package:flutter/material.dart';

import '../../../../domain/models/models.dart';
import 'evolution_cards.dart';

class PokemonEvolutionData extends StatefulWidget {
  final List<EvolutionChain> data;
  const PokemonEvolutionData({Key? key, required this.data}) : super(key: key);

  @override
  State<PokemonEvolutionData> createState() => _PokemonEvolutionDataState();
}

class _PokemonEvolutionDataState extends State<PokemonEvolutionData> {
  final GlobalKey<AnimatedListState> _key = GlobalKey<AnimatedListState>();

  late ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        for (int i = 0; i < widget.data.length; i++) {
          await Future.delayed(const Duration(milliseconds: 100),
              () => _key.currentState?.insertItem(i));
        }
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.data.isNotEmpty
      ? Scrollbar(
          controller: _controller,
          child: AnimatedList(
            controller: _controller,
            key: _key,
            itemBuilder: (context, index, animation) {
              final fade = Tween<double>(begin: 0, end: 1).animate(
                CurvedAnimation(
                  parent: animation,
                  curve: const Interval(0, 0.6, curve: Curves.easeIn),
                ),
              );
              return FadeTransition(
                  opacity: fade,
                  child: EvolutionCards(chain: widget.data[index]));
            },
          ),
        )
      : const ListTile(
          title: Text('No chain present'),
          subtitle:
              Text('There is no evoltion chain present with this pokemon'),
        );
}
