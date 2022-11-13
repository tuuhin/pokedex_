import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../domain/models/pokedex_model.dart';
import 'pokedex_simplified_card.dart';

class PokedexSimplifiedEntry extends StatefulWidget {
  final PokedexPokemonModel model;
  const PokedexSimplifiedEntry({
    super.key,
    required this.model,
  });

  @override
  State<PokedexSimplifiedEntry> createState() => _PokedexSimplifiedEntryState();
}

class _PokedexSimplifiedEntryState extends State<PokedexSimplifiedEntry>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));

    _scale = Tween<double>(begin: 0.2, end: 1).animate(
        CurvedAnimation(parent: _controller, curve: Curves.decelerate));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _showDetails() =>
      context.push('/pokedex-detailed/${widget.model.simple.pokemonId}',
          extra: widget.model);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return ScaleTransition(
          scale: _scale,
          alignment: Alignment.center,
          child: child,
        );
      },
      child: InkWell(
          onTap: _showDetails,
          child: PokedexSimplifiedCard(model: widget.model.simple)),
    );
  }
}
