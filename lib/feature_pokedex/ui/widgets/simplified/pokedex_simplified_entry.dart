import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../context/providers.dart';
import '../../../domain/models/pokedex_model.dart';
import 'pokedex_simplified_card.dart';

class PokedexSimplifiedEntry extends ConsumerStatefulWidget {
  final PokedexPokemonModel model;
  const PokedexSimplifiedEntry({
    super.key,
    required this.model,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PokedexSimplifiedEntryState();
}

class _PokedexSimplifiedEntryState extends ConsumerState<PokedexSimplifiedEntry>
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

  void _showDetails() {
    ref.read(currentSelectedPokemon(widget.model.id));
    context.push('/pokedex-detailed/${widget.model.simple.pokemonId}');
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) => ScaleTransition(
          scale: _scale, alignment: Alignment.center, child: child),
      child: GestureDetector(
          onTap: _showDetails,
          child: PokedexSimplifiedCard(model: widget.model.simple)),
    );
  }
}
