import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final IconData icon;
  final Function function;
  const Button({super.key, required this.icon, required this.function});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function(),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        width: 50,
        height: 50,
        child: Center(child: Icon(icon)),
      ),
    );
  }
}
