import 'package:aabhash_portfolio_website/presentation/sections/about/about.dart';
import 'package:aabhash_portfolio_website/presentation/sections/contact/contact.dart';
import 'package:aabhash_portfolio_website/presentation/sections/created_by/created_by.dart';
import 'package:aabhash_portfolio_website/presentation/sections/home/home.dart';
import 'package:aabhash_portfolio_website/presentation/sections/portfolio/portfolio.dart';
import 'package:aabhash_portfolio_website/presentation/sections/services/services.dart';
import 'package:flutter/material.dart';

class StaticUtils {
  static const String hi = 'assets/hi.gif';

  // work
  static const String dsc = 'assets/work/dsc.png';
  static const String sastaticket = 'assets/work/st.png';
  static const String university = 'assets/work/cui.png';
  static const String fullterIsb = 'assets/work/flutterIsl.png';

  // services

  static const String appDev = 'assets/icons/app-development.png';
  static const String webDev = 'assets/icons/web_development_icon.png';
  static const String backendDev = 'assets/icons/backend.png';
  static const String coaching = 'assets/icons/teach.png';

  static const String resume =
      'https://docs.google.com/document/d/1PuQstrLJ8hxkb_-1KkFMommzbJ0ts08h/edit?usp=share_link&ouid=103813353901071983306&rtpof=true&sd=true';

  static const String gitHub = 'https://github.com/AabhashRai13';
  static const String upWork = 'https://www.upwork.com/freelancers/aabhashrai';
}

class BodyUtils {
  static const List<Widget> views = [
    HomePage(),
    About(),
    Services(),
    Portfolio(),
    Contact(),
    CreatedByScreen()
  ];
}
