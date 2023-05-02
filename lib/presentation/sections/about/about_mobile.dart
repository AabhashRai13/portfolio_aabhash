import 'package:aabhash_portfolio_website/constants.dart';
import 'package:aabhash_portfolio_website/presentation/configs/app_dimensions.dart';
import 'package:aabhash_portfolio_website/presentation/configs/app_theme.dart';
import 'package:aabhash_portfolio_website/presentation/configs/app_typography.dart';
import 'package:aabhash_portfolio_website/presentation/configs/space.dart';
import 'package:aabhash_portfolio_website/presentation/utils/about_utils.dart';
import 'package:aabhash_portfolio_website/presentation/widget/tech_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class AboutMobile extends StatelessWidget {
  const AboutMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: Space.h,
      child: Column(
        children: [
          RichText(
            text: TextSpan(
              style: GoogleFonts.acme(textStyle: AppText.h1!),
              children: const <TextSpan>[
                TextSpan(
                  text: '\nFreelance ',
                ),
                TextSpan(
                    text: 'Flutter ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.blue)),
                TextSpan(
                  text: 'Full Stack Developer',
                )
              ],
            ),
          ),
          Space.y1!,
          Text(
            AboutUtils.aboutMeDetail,
            style: GoogleFonts.aBeeZee(
                textStyle: AppText.b2!.copyWith(
              height: 2,
              letterSpacing: 1,
              fontSize: AppDimensions.normalize(6),
            )),
          ),
          Space.y!,
          Text(
            'Tech Stack',
            style: AppText.b1!.copyWith(
              color: AppTheme.c!.primary,
            ),
          ),
          Space.y!,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: kTools
                .map(
                  (e) => ToolTechWidget(techName: e),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
