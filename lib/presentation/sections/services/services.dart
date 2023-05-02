import 'package:aabhash_portfolio_website/constants.dart';
import 'package:aabhash_portfolio_website/presentation/configs/configs.dart';
import 'package:aabhash_portfolio_website/presentation/responsive/responsive.dart';
import 'package:aabhash_portfolio_website/presentation/utils/services_utils.dart';
import 'package:aabhash_portfolio_website/presentation/widget/custom_text_heading.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
part 'services_desktop.dart';
part 'services_mobile.dart';

part 'widgets/_services_card.dart';
part 'widgets/_services_card_back.dart';

class Services extends StatelessWidget {
  const Services({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: ServiceMobile(),
      tablet: ServiceMobile(),
      desktop: ServiceDesktop(),
    );
  }
}
