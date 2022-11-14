import 'package:flutter/material.dart';

class RouterError extends StatelessWidget {
  final Exception? exception;
  const RouterError({Key? key, required this.exception}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/icons/wtf.png'),
              const SizedBox(height: 10),
              Text(exception.toString())
            ],
          ),
        ),
      );
}
