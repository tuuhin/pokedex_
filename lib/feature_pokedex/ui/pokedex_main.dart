import 'package:flutter/material.dart';

class MainPokDex extends StatelessWidget {
  const MainPokDex({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Text(
            'What Pokemon are you looking for ?',
            style: Theme.of(context).textTheme.headline4?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).textTheme.subtitle1?.color),
          ),
          const TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.zero,
              prefixIcon: Icon(Icons.search),
              hintText: 'Search Pokemon,Move or ability',
              fillColor: Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}
