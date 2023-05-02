import 'package:aabhash_portfolio_website/presentation/configs/configs.dart';
import 'package:aabhash_portfolio_website/constants.dart';
import 'package:aabhash_portfolio_website/presentation/utils/about_utils.dart';
import 'package:aabhash_portfolio_website/presentation/widget/tech_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutDesktop extends StatelessWidget {
  const AboutDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.fromLTRB(
        AppDimensions.normalize(30),
        AppDimensions.normalize(80),
        0,
        0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                  text: '\nFull Stack Developer',
                )
              ],
            ),
          ),
          Space.y1!,
          Row(
            children: [
              Expanded(
                flex: width < 1230 ? 2 : 1,
                child: Container(
                  padding: EdgeInsets.only(left: width < 1230 ? 25.0 : 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AboutUtils.aboutMeDetail,
                        style: GoogleFonts.aBeeZee(
                            textStyle: AppText.b2!.copyWith(
                          height: 2,
                          letterSpacing: 1,
                          fontSize: AppDimensions.normalize(6),
                        )),
                        textAlign: TextAlign.justify,
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
                            .map((e) => ToolTechWidget(
                                  techName: e,
                                ))
                            .toList(),
                      ),
                      Space.y!,
                      Divider(
                        color: Colors.grey[800],
                        thickness: AppDimensions.normalize(0.2),
                      ),
                      Space.y1!,
                    ],
                  ),
                ),
              ),
              Container(
                width: width < 1230 ? width * 0.05 : width * 0.1,
              ),
            ],
          )
        ],
      ),
    );
  }
}
