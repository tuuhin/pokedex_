import 'package:flutter/material.dart';

class PokemonNewsLoadFailed extends StatelessWidget {
  final void Function()? refresh;
  const PokemonNewsLoadFailed({Key? key, this.refresh}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/icons/error.png'),
        const SizedBox(height: 10),
        const Text("Some error Occured"),
        if (refresh != null)
          TextButton(
            onPressed: refresh,
            child: const Text('Try Again',
                style: TextStyle(color: Colors.blueAccent)),
          )
      ],
    );
  }
}
