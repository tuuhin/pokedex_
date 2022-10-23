import 'package:flutter/material.dart';
import 'package:flutter_pokedex/feature_poke_ability/context/provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../ui/ui.dart';

class PokemonAbilityPage extends ConsumerStatefulWidget {
  const PokemonAbilityPage({super.key});

  @override
  ConsumerState<PokemonAbilityPage> createState() => _PokemonAbilityPageState();
}

class _PokemonAbilityPageState extends ConsumerState<PokemonAbilityPage> {
  late final ScrollController _scrollController;

  void _scrollCallBack() {
    double delta = MediaQuery.of(context).size.height * .2;
    if (_scrollController.position.maxScrollExtent -
            _scrollController.position.pixels <=
        delta) {
      ref.read(pokemonAbilityProvider.notifier).fetchMore();
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollCallBack);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scrollbar(
        controller: _scrollController,
        child: CustomScrollView(
          controller: _scrollController,
          slivers: const [
            SliverAppBar(
              title: Text('Pokemon Ability'),
            ),
            PokemonAbilityLoader(),
            PokemonAbilityLoadMore()
          ],
        ),
      ),
    );
  }
}
