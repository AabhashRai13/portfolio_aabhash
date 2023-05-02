import 'package:aabhash_portfolio_website/presentation/responsive/responsive.dart';
import 'package:aabhash_portfolio_website/presentation/sections/home/home_desktop.dart';
import 'package:aabhash_portfolio_website/presentation/sections/home/home_mobile.dart';
import 'package:aabhash_portfolio_website/presentation/sections/home/home_tab.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: HomeMobile(),
      tablet: HomeTab(),
      desktop: HomeDesktop(),
    );
  }
}