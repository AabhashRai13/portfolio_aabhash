import 'package:aabhash_portfolio_website/constants.dart';
import 'package:aabhash_portfolio_website/presentation/utils/utils.dart';
import 'package:flutter/material.dart';

Future<void> deadDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('You died!'),
        content: const SingleChildScrollView(
          child: Text(
              'But your project doesn\'t need to.\nContact me if you want to give your project a life'),
        ),
        actions: <Widget>[
          ElevatedButton(
            onPressed: () {
              openURL(StaticUtils.upWork);
            },
            style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
                backgroundColor: Colors.green,
                minimumSize: const Size(100, 60)),
            child: const Text(
              'Hire Me Exclusively on Upwork!',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      );
    },
  );
}
