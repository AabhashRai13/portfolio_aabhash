import 'package:aabhash_portfolio_website/app/di.dart';
import 'package:aabhash_portfolio_website/presentation/sections/main/main_section.dart';
import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:aabhash_portfolio_website/presentation//configs/core_theme.dart'
    as theme;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAppModule();
  setPathUrlStrategy();
  runApp(const App());
}

class App extends StatefulWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aabhash',
      theme: theme.themeLight,
      darkTheme: theme.themeDark,
      initialRoute: "/",
      routes: {
        "/": (context) => const MainPage(),
      },
    );
  }
}
