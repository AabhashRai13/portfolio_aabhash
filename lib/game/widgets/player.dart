import 'package:flutter/material.dart';

class Player extends StatelessWidget {
  final double playerX;
  const Player({super.key, required this.playerX});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(playerX, 1),
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        height: 50,
        width: 50,
        child: Image.asset("assets/spongebob.png"),
      ),
    );
  }
}
