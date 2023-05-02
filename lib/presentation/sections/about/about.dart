import 'package:aabhash_portfolio_website/presentation/responsive/responsive.dart';
import 'package:aabhash_portfolio_website/presentation/sections/about/about_mobile.dart';
import 'package:aabhash_portfolio_website/presentation/sections/about/about_tablet.dart';
import 'package:flutter/material.dart';
import 'package:aabhash_portfolio_website/presentation/sections/about/about_desktop.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      tablet: AboutTab(),
      mobile: AboutMobile(),
      desktop: AboutDesktop(),
    );
  }
}
