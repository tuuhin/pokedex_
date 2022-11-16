import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingInfo extends StatelessWidget {
  final Color color;
  final String text;
  const LoadingInfo({Key? key, required this.text, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SpinKitRotatingCircle(
          size: 80,
          itemBuilder: (context, index) => Container(
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
              boxShadow: [BoxShadow(color: color, blurRadius: 10)],
              border: Border.all(color: Colors.black, width: 2),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(text)
      ],
    );
  }
}
