import 'package:aabhash_portfolio_website/constants.dart';
import 'package:aabhash_portfolio_website/presentation/configs/configs.dart';
import 'package:aabhash_portfolio_website/presentation/utils/project_utils.dart';
import 'package:aabhash_portfolio_website/presentation/utils/utils.dart';
import 'package:aabhash_portfolio_website/presentation/widget/custom_text_heading.dart';
import 'package:aabhash_portfolio_website/presentation/widget/project_card.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class PortfolioMobileTab extends StatelessWidget {
  const PortfolioMobileTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        const CustomSectionHeading(
          text: "\nPortfolio",
        ),
        CarouselSlider.builder(
          itemCount: ProjectUtils.titles.length,
          itemBuilder: (BuildContext context, int itemIndex, int i) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: ProjectCard(
              projectIcon: ProjectUtils.icons[i],
              projectLink: ProjectUtils.links[i],
              projectTitle: ProjectUtils.titles[i],
            ),
          ),
          options: CarouselOptions(
            height: height * 0.4,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 5),
            enlargeCenterPage: true,
            autoPlayCurve: Curves.fastOutSlowIn,
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            enableInfiniteScroll: false,
          ),
        ),
        Space.y!,
        SizedBox(
          height: AppDimensions.normalize(14),
          width: AppDimensions.normalize(50),
          child: MaterialButton(
            hoverColor: AppTheme.c!.shadowSub,
            onPressed: () => openURL(StaticUtils.gitHub),
            child: Text(
              'See More',
              style: TextStyle(color: AppTheme.c!.primary),
            ),
          ),
        )
      ],
    );
  }
}
