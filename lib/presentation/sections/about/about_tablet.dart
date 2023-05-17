import 'package:aabhash_portfolio_website/constants.dart';
import 'package:aabhash_portfolio_website/presentation/configs/configs.dart';
import 'package:aabhash_portfolio_website/presentation/utils/about_utils.dart';
import 'package:aabhash_portfolio_website/presentation/widget/tech_widget.dart';
import 'package:aabhash_portfolio_website/youtube/youtube_player.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class AboutTab extends StatelessWidget {
  const AboutTab({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.fromLTRB(
        AppDimensions.normalize(30),
        AppDimensions.normalize(30),
        0,
        0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          style:
                              GoogleFonts.merriweather(textStyle: AppText.h1!),
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
                      Space.y!,
                      Text(
                        AboutUtils.aboutMeDetail,
                        style: GoogleFonts.merriweather(
                            fontWeight: FontWeight.w500,
                            textStyle: AppText.b2!.copyWith(
                              height: 2,
                              fontSize: AppDimensions.normalize(5),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
              const Expanded(
                  flex: 2, child: Center(child: YoutubePlayerScreen())),
            ],
          ),
          Space.y!,
          Text(
            'Tech Stack',
            style: AppText.h3!.copyWith(
              color: AppTheme.c!.primary,
            ),
          ),
          Row(
            children: kTools
                .map((e) => ToolTechWidget(
                      techName: e,
                    ))
                .toList(),
          ),
          SizedBox(
            height: height < 821 ? height * 0.2 : height * 0.02,
          ),
        ],
      ),
    );
  }
}
