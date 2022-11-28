import 'package:flutter/material.dart';

class EvolutionError extends StatelessWidget {
  const EvolutionError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(flex: 1),
        Image.asset('assets/icons/evolution.png'),
        const SizedBox(height: 10),
        Text('Error Occured while fetching data',
            style: Theme.of(context).textTheme.subtitle1),
        Text('Try agian latter', style: Theme.of(context).textTheme.caption),
        const Spacer(flex: 8)
      ],
    );
  }
}
