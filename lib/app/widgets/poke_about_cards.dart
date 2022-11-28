import 'package:flutter/material.dart';

class PokeMonAboutCards extends StatelessWidget {
  final Color color;
  final String title;
  final void Function() onTap;
  const PokeMonAboutCards({
    Key? key,
    required this.color,
    required this.onTap,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.8),
              offset: const Offset(0, 5),
              blurRadius: 8,
              spreadRadius: 2,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Stack(
            alignment: FractionalOffset.center,
            children: [
              Positioned(
                left: 100,
                child: Opacity(
                  opacity: 0.3,
                  child: Image.asset('assets/icons/poke_ball.png', scale: 9),
                ),
              ),
              Positioned(
                right: 120,
                bottom: 50,
                child: Opacity(
                  opacity: 0.25,
                  child: Image.asset('assets/icons/poke_ball.png', scale: 9),
                ),
              ),
              Positioned(
                left: 15,
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    letterSpacing: 3,
                    fontFamily: "Pokemon",
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
