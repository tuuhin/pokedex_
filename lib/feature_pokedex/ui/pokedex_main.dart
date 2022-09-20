import 'package:flutter/material.dart';
import './widgets/widgets.dart';

class MainPokDex extends StatelessWidget {
  const MainPokDex({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Theme.of(context).cardColor),
      child: Column(
        children: const [
          SizedBox(height: 20),
          PokeMonHeader(),
          Expanded(
            child: PokeMonAboutCardList(),
          )
        ],
      ),
    );
  }
}
