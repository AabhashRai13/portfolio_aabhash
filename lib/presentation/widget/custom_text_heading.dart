import 'package:aabhash_portfolio_website/presentation/configs/configs.dart';
import 'package:flutter/material.dart';

class CustomSectionHeading extends StatelessWidget {
  final String text;

  const CustomSectionHeading({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppText.h1!.copyWith(
        fontFamily: 'Montserrat',
      ),
    );
  }
}

