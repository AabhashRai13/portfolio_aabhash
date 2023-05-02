import 'package:flutter/material.dart';

class NavBarLogo extends StatelessWidget {
  const NavBarLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => const LinearGradient(
        colors: [Colors.blue, Color(0xffad9c00)],
        begin: Alignment.centerLeft,
        end: Alignment.bottomCenter,
      ).createShader(bounds),
      child: const Text(
        'Samurai Coder',
        style: TextStyle(
          fontSize: 36.0,
          color: Colors.white,
        ),
      ),
    );
  }
}
