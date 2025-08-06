import 'dart:async';

import 'package:ffgame/game.dart';
import 'package:ffgame/helpers.dart';
import 'package:ffgame/parallax.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/painting.dart';

class PlayArea extends RectangleComponent
    with TapCallbacks, HasGameReference<FFGame> {
  PlayArea()
      : super(
          paint: Paint()..color = Color(0xFF0d091c),
          children: [RectangleHitbox()],
        );

  @override
  FutureOr<void> onLoad() {
    size = Vector2(game.size.x, game.size.y);
    add(RectangleComponent(
      paint: Paint()..color = Color.fromARGB(255, 28, 21, 52),
      size: Vector2(game.size.x, game.size.y),
      position: Vector2(0, game.bottomLeft.y + game.groundPosition),
    ));
    add(ParallaxController(
      eachSize: Vector2(1200, 600),
      sprite: Sprite(game.imageHolder.sky),
      speed: 0.005,
      yPosition: game.topLeft.y + 420,
    ));
    add(ParallaxController(
      eachSize: Vector2(1024, 512),
      sprite: Sprite(game.imageHolder.buildings2),
      speed: 0.06,
      yPosition: game.topLeft.y + 540,
    ));
    add(ParallaxController(
      eachSize: Vector2(1200, 600),
      sprite: Sprite(game.imageHolder.buildings1),
      speed: 0.09,
      yPosition: game.topLeft.y + 420,
    ));
    add(ParallaxController(
      eachSize: Vector2(1024, 512),
      sprite: Sprite(game.imageHolder.grass),
      speed: 1,
      yPosition: game.bottomLeft.y + game.groundPosition - 140,
    ));

    return super.onLoad();
  }

  @override
  void onTapDown(TapDownEvent event) {
    game.player.jump();
    super.onTapDown(event);
  }

  @override
  void onTapUp(TapUpEvent event) {
    game.player.stopTimer();
    super.onTapUp(event);
  }
}
