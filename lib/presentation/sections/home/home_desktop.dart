import 'package:aabhash_portfolio_website/game/game.dart';
import 'package:aabhash_portfolio_website/presentation/animations/entrance_fader.dart';
import 'package:aabhash_portfolio_website/presentation/configs/configs.dart';
import 'package:aabhash_portfolio_website/presentation/utils/utils.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class HomeDesktop extends StatelessWidget {
  const HomeDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height,
      padding: EdgeInsets.only(
        right: 10,
        bottom: AppDimensions.normalize(20),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              margin: EdgeInsets.fromLTRB(
                AppDimensions.normalize(30),
                AppDimensions.normalize(80),
                0,
                0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'WELCOME TO MY PORTFOLIO! ',
                        style: AppText.l1b!.copyWith(
                          fontFamily: 'Montserrat',
                        ),
                      ),
                      (size.width < 1092)
                          ? const SizedBox()
                          : EntranceFader(
                              offset: const Offset(0, 0),
                              delay: const Duration(seconds: 2),
                              duration: const Duration(milliseconds: 800),
                              child: Image.asset(
                                StaticUtils.hi,
                                height: AppDimensions.normalize(12),
                              ),
                            ),
                    ],
                  ),
                  Space.y1!,
                  (size.height < 440)
                      ? Text(
                          "Aabhash Rai",
                          style: AppText.h1!.copyWith(
                            fontFamily: 'Montserrat',
                            fontSize: AppDimensions.normalize(10),
                            fontWeight: FontWeight.w100,
                          ),
                        )
                      : Text(
                          "Aabhash",
                          style: AppText.h1!.copyWith(
                            fontFamily: 'Montserrat',
                            fontSize: AppDimensions.normalize(25),
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                  (size.height < 510)
                      ? const SizedBox.shrink()
                      : Text(
                          "Rai",
                          style: AppText.h1b!.copyWith(
                            fontSize: AppDimensions.normalize(25),
                            height: 1,
                          ),
                        ),
                  (size.height < 560)
                      ? const SizedBox.shrink()
                      : EntranceFader(
                          offset: const Offset(-10, 0),
                          delay: const Duration(seconds: 1),
                          duration: const Duration(milliseconds: 800),
                          child: Row(
                            children: [
                              Icon(
                                Icons.play_arrow_rounded,
                                color: AppTheme.c!.primary!,
                              ),
                              AnimatedTextKit(
                                animatedTexts: [
                                  TyperAnimatedText(
                                    ' Flutter Developer',
                                    speed: const Duration(milliseconds: 50),
                                    textStyle: AppText.b1,
                                  ),
                                  TyperAnimatedText(
                                    ' Problem solver',
                                    speed: const Duration(milliseconds: 50),
                                    textStyle: AppText.b1,
                                  ),
                                  TyperAnimatedText(
                                    ' Flutter instructor',
                                    speed: const Duration(milliseconds: 50),
                                    textStyle: AppText.b1,
                                  ),
                                ],
                                isRepeatingAnimation: true,
                              ),
                            ],
                          ),
                        ),
                ],
              ),
            ),
          ),
          const Spacer(),
          const Expanded(flex: 4, child: Game()),
        ],
      ),
    );
  }
}
