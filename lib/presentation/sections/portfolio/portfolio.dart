import 'package:aabhash_portfolio_website/presentation/responsive/responsive.dart';
import 'package:aabhash_portfolio_website/presentation/sections/portfolio/portfolio_desktop.dart';
import 'package:aabhash_portfolio_website/presentation/sections/portfolio/portfolio_mobile.dart';
import 'package:flutter/material.dart';

class Portfolio extends StatelessWidget {
  const Portfolio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: PortfolioMobileTab(),
      tablet: PortfolioMobileTab(),
      desktop: PortfolioDesktop(),
    );
  }
}