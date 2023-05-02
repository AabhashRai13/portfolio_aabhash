import 'package:aabhash_portfolio_website/presentation/configs/configs.dart';
import 'package:aabhash_portfolio_website/presentation/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants.dart';

class ContactDesktop extends StatelessWidget {
  const ContactDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: AppTheme.c!.shadowSub,
            borderRadius: const BorderRadius.all(Radius.circular(40))),
        padding: Space.all(1, 1),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              "Start your dream project!",
              style: GoogleFonts.aBeeZee(
                  textStyle:
                      AppText.b1!.copyWith(color: AppTheme.c!.primaryLight)),
            ),
            Space.y!,
            Text(
              "Let's Work Together!",
              style: GoogleFonts.aBeeZee(
                  textStyle: AppText.h1!.copyWith(color: AppTheme.c!.primary)),
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {
                openURL(StaticUtils.upWork);
              },
              style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  backgroundColor: Colors.green,
                  minimumSize: const Size(300, 80)),
              child: const Text(
                'Hire Me Exclusively on Upwork!',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
