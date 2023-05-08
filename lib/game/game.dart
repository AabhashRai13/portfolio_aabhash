import 'dart:async';

import 'package:aabhash_portfolio_website/game/widgets/buttons.dart';
import 'package:aabhash_portfolio_website/game/widgets/missile.dart';
import 'package:aabhash_portfolio_website/game/widgets/player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Game(),
    );
  }
}

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  /// player variable
  double playerX = 0;

  /// missile variable
  double missileX = 0;

  double missileHeight = 10;
  bool midshot = false;
  void moveLeft() {
    if (playerX - 0.1 < -1) return;
    setState(() {
      playerX -= 0.05;
      //// only make the xcoordinate same when it is not in the middle of the shot
      if (!midshot) {
        missileX = playerX;
      }
    });
  }

  void moveRight() {
    if (playerX + 0.1 > 1) return;
    setState(() {
      playerX += 0.05;
      if (!midshot) {
        missileX = playerX;
      }
    });
  }

  void fireMissile() {
    if (midshot == false) {
      Timer.periodic(const Duration(milliseconds: 20), (timer) {
        midshot = true;
        setState(() {
          missileHeight += 10;
        });

        if (missileHeight > MediaQuery.of(context).size.height * 3 / 4) {
          //stop missile
          resetMissile();
          timer.cancel();
          midshot = false;
        }
      });
    }
  }

  void resetMissile() {
    missileX = playerX;
    missileHeight = 10;
  }

  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      focusNode: FocusNode(),
      autofocus: true,
      onKey: (RawKeyEvent eventKey) {
        if (eventKey.isKeyPressed(LogicalKeyboardKey.arrowLeft)) {
          moveLeft();
        } else if (eventKey.isKeyPressed(LogicalKeyboardKey.arrowRight)) {
          moveRight();
        } else if (eventKey.isKeyPressed(LogicalKeyboardKey.arrowUp) ||
            eventKey.isKeyPressed(LogicalKeyboardKey.space)) {
          fireMissile();
        }
      },
      child: Column(
        children: [
          Expanded(
              flex: 3,
              child: Container(
                color: Colors.pink[100],
                child: Center(
                    child: Stack(
                  children: [
                    Missile(
                      missileHeight: missileHeight,
                      missileX: missileX,
                    ),
                    Player(playerX: playerX)
                  ],
                )),
              )),
          Expanded(
              child: Container(
            color: Colors.grey,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Button(
                  icon: Icons.arrow_back,
                  function: () => moveLeft,
                ),
                Button(
                  icon: Icons.arrow_upward,
                  function: () => fireMissile,
                ),
                Button(
                  icon: Icons.arrow_forward,
                  function: () => moveRight,
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
