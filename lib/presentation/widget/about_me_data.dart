import 'package:aabhash_portfolio_website/presentation/configs/configs.dart';
import 'package:flutter/material.dart';

class AboutMeData extends StatelessWidget {
  final String data;
  final String information;
  final Alignment? alignment;

  const AboutMeData({
    Key? key,
    required this.data,
    required this.information,
    this.alignment,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return Align(
      alignment: alignment ?? Alignment.center,
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "$data: ",
              style: AppText.l1b!.copyWith(
                color:  Colors.white ,
              ),
            ),
            TextSpan(
              text: " $information\n",
              style: AppText.l1!.copyWith(
                color:  Colors.white 
              ),
            ),
          ],
        ),
      ),
    );
  }
}
