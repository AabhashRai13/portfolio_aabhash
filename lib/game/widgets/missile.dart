import 'package:flutter/material.dart';

class Missile extends StatelessWidget {
  final double missileX;

  final double missileHeight;
  const Missile({
    super.key,
    required this.missileHeight,
    required this.missileX,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(missileX, 1),
      child: Container(
        width: 1,
        height: missileHeight,
        decoration: BoxDecoration(
          color: Colors.pink[100],
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
      ),
    );
  }
}
