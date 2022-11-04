import 'package:flutter/material.dart';

class PokeMonAboutCards extends StatelessWidget {
  final Color? color;
  final String aboutText;
  final void Function()? onTap;
  const PokeMonAboutCards({
    Key? key,
    this.color,
    this.onTap,
    required this.aboutText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: color,
      borderRadius: BorderRadius.circular(15),
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: color != null ? color!.withOpacity(0.75) : Colors.grey,
                offset: const Offset(0, 5),
                blurRadius: 8,
                spreadRadius: 2),
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
                  aboutText,
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
