import 'package:aabhash_portfolio_website/app/di.dart';
import 'package:aabhash_portfolio_website/constants.dart';
import 'package:aabhash_portfolio_website/presentation/animations/entrance_fader.dart';
import 'package:aabhash_portfolio_website/presentation/blocs/drawer_cubit/drawer_cubit.dart';
import 'package:aabhash_portfolio_website/presentation/configs/app.dart';
import 'package:aabhash_portfolio_website/presentation/configs/configs.dart';
import 'package:aabhash_portfolio_website/presentation/responsive/responsive.dart';
import 'package:aabhash_portfolio_website/presentation/utils/navbar_utils.dart';
import 'package:aabhash_portfolio_website/presentation/utils/utils.dart';
import 'package:aabhash_portfolio_website/presentation/widget/arrow_on_top.dart';
import 'package:aabhash_portfolio_website/presentation/widget/navbar_actions_button.dart';
import 'package:aabhash_portfolio_website/presentation/widget/navbar_logo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universal_html/html.dart' as html;
import 'package:flutter/material.dart';

import '../../blocs/scroll_cubit/scroll_cubit.dart';

part 'widgets/navbar_desktop.dart';
part 'widgets/mobile_drawer.dart';
part 'widgets/body.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final DrawerCubit drawerCubit = sl<DrawerCubit>();
  @override
  Widget build(BuildContext context) {
    App.init(context);

    return Scaffold(
      key: drawerCubit.scafoldKey,
      extendBodyBehindAppBar: true,
      drawer: !Responsive.isDesktop(context) ? MobileDrawer() : null,
      body: SafeArea(
        child: Stack(
          children: [
            Body(),
            const ArrowOnTop(),
            Responsive.isTablet(context) || Responsive.isMobile(context)
                ? _NavBarTablet()
                : const _NavbarDesktop(),
          ],
        ),
      ),
    );
  }
}
