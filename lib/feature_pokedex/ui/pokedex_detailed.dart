import 'package:flutter/material.dart';
import 'package:flutter_pokedex/core/util/string_helper.dart';
import 'package:flutter_pokedex/feature_pokedex/domain/models/models.dart';
import 'package:vector_math/vector_math_64.dart' show radians;

import '../../core/data/pokemon_type/pokemon_type.dart';
import 'widgets/detailed/widgets/styled_pokedex_app_bar.dart';
import 'widgets/widgets.dart';

class PokedexDetailed extends StatelessWidget {
  final PokedexPokemonModel data;
  const PokedexDetailed({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    PokeMonType type =
        PokeMonType.getPokeMonTypeByName(data.simple.types.first);
    return Title(
      title: data.simple.name,
      color: type.primaryColor,
      child: Scaffold(
        backgroundColor: type.primaryColor,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.white),
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.favorite_outline)),
              const SizedBox(width: 10),
            ]),
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
                right: 100,
                child: Opacity(
                    opacity: 0.4,
                    child: Image.asset('assets/icons/dot.png', scale: 8))),
            Positioned(
              left: -10,
              child: Transform.rotate(
                angle: radians(75),
                alignment: Alignment.center,
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    gradient: LinearGradient(
                      begin: const Alignment(-0.2, -0.2),
                      end: const Alignment(1.5, -0.3),
                      colors: [
                        Colors.white.withOpacity(0.15),
                        Colors.white.withOpacity(0.05),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            CustomScrollView(slivers: [
              SliverPersistentHeader(
                  pinned: true,
                  delegate:
                      StyledPokedexAppBar(data, height: size.height * .5)),
              PokemonDetailsTab(model: data)
            ]),
          ],
        ),
      ),
    );
  }
}
