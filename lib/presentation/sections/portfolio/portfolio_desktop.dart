import 'package:aabhash_portfolio_website/constants.dart';
import 'package:aabhash_portfolio_website/presentation/configs/configs.dart';
import 'package:aabhash_portfolio_website/presentation/utils/project_utils.dart';
import 'package:aabhash_portfolio_website/presentation/utils/utils.dart';
import 'package:aabhash_portfolio_website/presentation/widget/custom_text_heading.dart';
import 'package:aabhash_portfolio_website/presentation/widget/project_card.dart';
import 'package:flutter/material.dart';

class PortfolioDesktop extends StatefulWidget {
  const PortfolioDesktop({Key? key}) : super(key: key);

  @override
  State<PortfolioDesktop> createState() => _PortfolioDesktopState();
}

class _PortfolioDesktopState extends State<PortfolioDesktop> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Space.h!,
      child: Column(
        children: [
          const CustomSectionHeading(
            text: "\nPortfolio",
          ),
          Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            runSpacing: AppDimensions.normalize(10),
            children: ProjectUtils.banners
                .asMap()
                .entries
                .map(
                  (e) => ProjectCard(
                    banner: e.value,
                    projectIcon: ProjectUtils.icons[e.key],
                    projectLink: ProjectUtils.links[e.key],
                    projectTitle: ProjectUtils.titles[e.key],
                  ),
                )
                .toList(),
          ),
          Space.y2!,
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
      ),
    );
  }
}
