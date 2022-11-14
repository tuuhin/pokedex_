import 'package:flutter/material.dart';

class LoadMoreErrorWidget extends StatelessWidget {
  const LoadMoreErrorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/icons/error.png'),
            const VerticalDivider(),
            Text('Error Occured...',
                style: Theme.of(context).textTheme.subtitle1)
          ],
        ),
      );
}
