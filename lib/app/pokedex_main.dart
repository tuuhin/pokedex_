import 'package:flutter/material.dart';
import './widgets/widgets.dart';

class MainPokDex extends StatelessWidget {
  const MainPokDex({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
        color: Theme.of(context).cardColor,
      ),
      child: Column(
        children: const [
          PokeMonHeader(),
          Expanded(
            child: PokeMonAboutCardList(),
          )
        ],
      ),
    );
  }
}
