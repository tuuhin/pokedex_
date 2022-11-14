import 'package:flutter/material.dart';

class PaginatorErrorWidget extends StatelessWidget {
  final void Function()? refresh;
  const PaginatorErrorWidget({
    Key? key,
    this.refresh,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/icons/warning.png'),
        const Text("Error occured cannot load the page"),
        if (refresh != null)
          TextButton(
            onPressed: refresh,
            child: const Text(
              'Try Again',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Colors.redAccent,
              ),
            ),
          )
      ],
    );
  }
}
