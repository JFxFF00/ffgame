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
          paint: Paint()..color = Color(0xff123826),
          children: [RectangleHitbox()],
        );

  @override
  FutureOr<void> onLoad() {
    size = Vector2(game.size.x, game.size.y);
    add(ParallaxController(
      eachSize: Vector2((FFGame.groundYPosition) * 2, FFGame.groundYPosition),
      sprite: Sprite(game.imageHolder.sky),
      speed: 0.005,
      yPosition: 0,
    ));
    add(ParallaxController(
      eachSize: Vector2(400, 200),
      sprite: Sprite(game.imageHolder.buildings1),
      speed: 0.04,
      yPosition: FFGame.groundYPosition - 200,
    ));
    add(ParallaxController(
      eachSize: Vector2(FFGame.groundYPosition * 2, FFGame.groundYPosition),
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
      yPosition: FFGame.groundYPosition - 300,
    ));
    add(ParallaxController(
      eachSize: Vector2(FFGame.groundYPosition * 2, FFGame.groundYPosition),
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
      yPosition: FFGame.groundYPosition - 500,
    ));
    add(ParallaxController(
      eachSize: Vector2(FFGame.groundYPosition * 2, FFGame.groundYPosition),
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
      yPosition: FFGame.groundYPosition - 700,
    ));
    add(ParallaxController(
      eachSize: Vector2(1024, 512),
      sprite: Sprite(game.imageHolder.grass),
      speed: 1,
      yPosition: FFGame.groundYPosition - 130,
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
