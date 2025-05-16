import 'dart:async';

import 'package:ffgame/game.dart';
import 'package:ffgame/helpers.dart';
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
