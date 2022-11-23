import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart' show radians;

class RotatingFlexPokeBall extends StatefulWidget {
  final double size;
  const RotatingFlexPokeBall({Key? key, required this.size}) : super(key: key);

  @override
  State<RotatingFlexPokeBall> createState() => _RotatingFlexPokeBallState();
}

class _RotatingFlexPokeBallState extends State<RotatingFlexPokeBall>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 10));

    _rotation = Tween<double>(begin: 0, end: 360).animate(_controller);

    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.rotate(
          angle: radians(_rotation.value),
          child: child,
        );
      },
      child: Image.asset('assets/icons/poke_ball.png',
          color: Colors.white.withOpacity(0.2), scale: widget.size),
    );
  }
}
