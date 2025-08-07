import 'dart:async';

import 'package:ffgame/game.dart';
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
    add(ParallaxController(
      eachSize: Vector2((game.size.y - game.groundPosition) * 2,
          game.size.y - game.groundPosition),
      sprite: Sprite(game.imageHolder.sky),
      speed: 0.005,
      yPosition: 0,
    ));
    add(ParallaxController(
      eachSize: Vector2(400, 200),
      sprite: Sprite(game.imageHolder.buildings1),
      speed: 0.04,
      yPosition: game.size.y - 200 - game.groundPosition,
    ));
    add(ParallaxController(
      eachSize: Vector2((game.size.y - game.groundPosition) * 2,
          game.size.y - game.groundPosition),
      sprite: Sprite(game.imageHolder.sky),
      speed: 0.005,
      yPosition: 0,
      opacity: 0.4,
    ));
    add(ParallaxController(
      eachSize: Vector2(600, 300),
      sprite: Sprite(game.imageHolder.buildings1),
      speed: 0.06,
      xPosition: 100,
      yPosition: game.size.y - 300 - game.groundPosition,
    ));
    add(ParallaxController(
      eachSize: Vector2((game.size.y - game.groundPosition) * 2,
          game.size.y - game.groundPosition),
      sprite: Sprite(game.imageHolder.sky),
      speed: 0.005,
      yPosition: 0,
      opacity: 0.4,
    ));
    add(ParallaxController(
      eachSize: Vector2(1000, 500),
      sprite: Sprite(game.imageHolder.buildings1),
      speed: 0.08,
      xPosition: -100,
      yPosition: game.size.y - 500 - game.groundPosition,
    ));
    add(ParallaxController(
      eachSize: Vector2((game.size.y - game.groundPosition) * 2,
          game.size.y - game.groundPosition),
      sprite: Sprite(game.imageHolder.sky),
      speed: 0.005,
      yPosition: 0,
      opacity: 0.4,
    ));
    add(ParallaxController(
      eachSize: Vector2(1400, 700),
      sprite: Sprite(game.imageHolder.buildings1),
      speed: 0.14,
      xPosition: 300,
      yPosition: game.size.y - 700 - game.groundPosition,
    ));
    add(ParallaxController(
      eachSize: Vector2(1024, 512),
      sprite: Sprite(game.imageHolder.grass),
      speed: 1,
      yPosition: game.size.y - game.groundPosition - 130,
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
