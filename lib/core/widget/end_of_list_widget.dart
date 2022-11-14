import 'package:flutter/material.dart';

class EndOfListWidget extends StatelessWidget {
  final String text;
  const EndOfListWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/icons/flag.png'),
            const VerticalDivider(),
            Text(text),
            const VerticalDivider(),
            Image.asset('assets/icons/the-end.png'),
          ],
        ),
      );
}
