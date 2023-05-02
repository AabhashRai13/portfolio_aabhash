import 'package:aabhash_portfolio_website/presentation/configs/configs.dart';
import 'package:flutter/material.dart';

class ToolTechWidget extends StatelessWidget {
  final String techName;

  const ToolTechWidget({Key? key, required this.techName}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppDimensions.normalize(6)),
      child: Image.asset("assets/icons/$techName.png"),
    );
  }
}
