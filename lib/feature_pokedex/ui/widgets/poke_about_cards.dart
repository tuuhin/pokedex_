import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PokeMonAboutCards extends StatelessWidget {
  final Color? color;
  final String aboutText;
  const PokeMonAboutCards({super.key, this.color, required this.aboutText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: color != null ? color!.withOpacity(0.6) : Colors.grey,
                offset: const Offset(0, 5),
                blurRadius: 6,
                spreadRadius: 1),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Stack(
            clipBehavior: Clip.hardEdge,
            alignment: FractionalOffset.center,
            children: [
              Positioned(
                left: 100,
                child: Opacity(
                    opacity: 0.3,
                    child: Image.asset('assets/icons/poke_ball.png', scale: 9)),
              ),
              Positioned(
                right: 120,
                bottom: 50,
                child: Opacity(
                    opacity: 0.25,
                    child: Image.asset('assets/icons/poke_ball.png', scale: 9)),
              ),
              Positioned(
                left: 15,
                child: Text(
                  aboutText,
                  style: Theme.of(context).textTheme.subtitle1?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontFamily: GoogleFonts.poppins().fontFamily),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
