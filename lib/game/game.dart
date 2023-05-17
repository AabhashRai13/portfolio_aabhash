import 'dart:async';
import 'dart:math';
import 'package:aabhash_portfolio_website/game/widgets/ball.dart';
import 'package:aabhash_portfolio_website/game/widgets/buttons.dart';
import 'package:aabhash_portfolio_website/game/widgets/dead_dialog.dart';
import 'package:aabhash_portfolio_website/game/widgets/missile.dart';
import 'package:aabhash_portfolio_website/game/widgets/player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../presentation/configs/configs.dart';

enum Direction { left, right }

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

  /// ball vairable
  double ballX = 1.1;
  double ballY = 0;
  int ballSpeed = 20;
  var ballDirection = Direction.left;
  bool gameStarted = false;
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
        //stop missile when it reaches to top

        if (missileHeight > MediaQuery.of(context).size.height * 3 / 4) {
          resetMissile();
          timer.cancel();
        }

        /// check if missile has hit the ball
        if (ballY > heightToPosition(missileHeight) &&
            (ballX - missileX).abs() < 0.03) {
          resetMissile();

          ballX = 1.1;
          timer.cancel();
          setState(() {
            ballSpeed -= 4;
          });
        }
      });
    }
  }

  void resetMissile() {
    missileX = playerX;
    missileHeight = 10;
    midshot = false;
  }

  void resetBall() {
    ballX = 1.1;
  }

  void startGame() {
    gameStarted = true;
    double time = 0;
    double height = 0;
    // how strong the jump is
    int velocity = 70;

    Timer.periodic(Duration(milliseconds: ballSpeed), (timer) {
      randomVelocity(30, 70);
      // quadetric equation that models the bounce (upside down parabola)
      height = -5 * time * time + velocity * time;
      // if the ball reaches the ground reset the jump
      if (height < 0) {
        time = 0;
      }

      /// update the new ball position
      setState(() {
        ballY = heightToPosition(height);
      });

      /// if ball hits the left wall move the ball to right
      if (ballX - 0.005 < -1) {
        ballDirection = Direction.right;
        velocity = randomVelocity(50, 70);
      }

      /// if ball hits the right  wall move the ball to left

      else if (ballX + 0.005 > 1) {
        ballDirection = Direction.left;
        velocity = randomVelocity(50, 70);
      }

      /// moving the ball in the correct direction
      if (ballDirection == Direction.left) {
        setState(() {
          ballX -= 0.005;
        });
      } else if (ballDirection == Direction.right) {
        setState(() {
          ballX += 0.005;
        });
      }
      //check if ball hits the player
      if (playerDies()) {
        timer.cancel();
        deadDialog(context);
        gameStarted = false;
      }
      time += 0.1;

      //
    });
  }

  /// convert heigt to Position
  double heightToPosition(double height) {
    double totalHeight = MediaQuery.of(context).size.height * 3 / 4;
    double position = 1 - 2 * height / totalHeight;
    return position;
  }

  bool playerDies() {
    // if ball position and player position
    // are same the player dies
    if ((ballX - playerX).abs() < 0.05 && ballY > 0.9) {
      resetBall();
      return true;
    } else {
      return false;
    }
  }

  final _random = Random();
  int randomVelocity(int min, int max) => min + _random.nextInt(max - min);
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
      child: Padding(
        padding: const EdgeInsets.only(top: 2),
        child: Column(
          children: [
            Expanded(
                flex: 3,
                child: Container(
                  color: Colors.blue[100],
                  child: Center(
                      child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Press Play",
                                style: AppText.l1!.copyWith(
                                  color: Colors.white,
                                  fontSize: AppDimensions.normalize(16),
                                  height: 1,
                                ),
                              ),
                              SizedBox(
                                  height: 50,
                                  width: 50,
                                  child: Image.asset("assets/icons/heart.png")),
                            ],
                          ),
                        ),
                      ),
                      Ball(ballX: ballX, ballY: ballY),
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
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Button(
                    icon: Icons.play_arrow,
                    function: () => gameStarted ? () {} : startGame,
                  ),
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
      ),
    );
  }
}
