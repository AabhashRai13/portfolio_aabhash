import 'package:aabhash_portfolio_website/constants.dart';
import 'package:aabhash_portfolio_website/presentation/configs/app_dimensions.dart';
import 'package:aabhash_portfolio_website/presentation/configs/app_theme.dart';
import 'package:aabhash_portfolio_website/presentation/configs/app_typography.dart';
import 'package:aabhash_portfolio_website/presentation/configs/space.dart';
import 'package:aabhash_portfolio_website/presentation/utils/about_utils.dart';
import 'package:aabhash_portfolio_website/presentation/widget/tech_widget.dart';
import 'package:aabhash_portfolio_website/youtube/youtube_player.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class AboutMobile extends StatelessWidget {
  const AboutMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(8, 90, 8, 8),
      child: Column(
        children: [
          RichText(
            text: TextSpan(
              style: GoogleFonts.merriweather(textStyle: AppText.b1!),
              children: <TextSpan>[
                const TextSpan(
                  text: 'Freelance ',
                ),
                TextSpan(
                    text: 'Flutter ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppTheme.c!.primaryLight)),
                const TextSpan(
                  text: 'Full Stack Developer',
                )
              ],
            ),
          ),
          SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              width: double.infinity,
              child: const YoutubePlayerScreen()),
          Space.y1!,
          Text(
            AboutUtils.aboutMeDetail,
            style: GoogleFonts.merriweather(
                fontWeight: FontWeight.w500,
                textStyle: AppText.b2!.copyWith(
                  height: 2,
                  fontSize: AppDimensions.normalize(5),
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
