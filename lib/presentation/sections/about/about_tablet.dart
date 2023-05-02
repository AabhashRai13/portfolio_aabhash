import 'package:aabhash_portfolio_website/constants.dart';
import 'package:aabhash_portfolio_website/presentation/configs/configs.dart';
import 'package:aabhash_portfolio_website/presentation/utils/about_utils.dart';
import 'package:aabhash_portfolio_website/presentation/widget/tech_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class AboutTab extends StatelessWidget {
  const AboutTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Container(
      padding: Space.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: height * 0.38,
          ),
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
          Row(
            children: kTools
                .map(
                  (e) => ToolTechWidget(techName: e),
                )
                .toList(),
          ),
          Space.y!,
          Divider(
            color: Colors.grey[800],
            thickness: AppDimensions.normalize(0.5),
          ),
          Space.y!,
        ],
      ),
    );
  }
}
