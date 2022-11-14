import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadMoreWidget extends StatelessWidget {
  final String message;
  const LoadMoreWidget({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SpinKitFadingCircle(
              size: 30,
              itemBuilder: (BuildContext context, int index) => DecoratedBox(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: index.isEven ? Colors.blue : Colors.white,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Text('Fetching More...',
                style: Theme.of(context).textTheme.subtitle1)
          ],
        ),
      );
}
