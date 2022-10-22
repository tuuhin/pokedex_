import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart' show radians;

class RotatingPokeBall extends StatefulWidget {
  const RotatingPokeBall({super.key});

  @override
  State<RotatingPokeBall> createState() => _RotatingPokeBallState();
}

class _RotatingPokeBallState extends State<RotatingPokeBall>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotation;
  late Animation<double> _fade;
  late Animation<Color?> _color;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 5000),
    );
    _rotation = Tween<double>(begin: 0.0, end: 360).animate(_controller);
    _fade = Tween<double>(begin: 0.2, end: 1).animate(CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.7, 1.0, curve: Curves.ease)));
    _color = ColorTween(begin: Colors.grey, end: Colors.transparent).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * .5,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) =>
            Transform.rotate(angle: radians(_rotation.value), child: child),
        child: Image.asset('assets/icons/poke_ball.png', color: _color.value),
      ),
    );
  }
}
