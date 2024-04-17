import 'dart:async';

import 'package:ffgame/game.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/painting.dart';

class PlayArea extends RectangleComponent with HasGameRef<FFGame> {
  PlayArea()
      : super(
          paint: Paint()..color = Color(0xFF0d091c),
          children: [RectangleHitbox()],
        );

  @override
  FutureOr<void> onLoad() {
    size = Vector2(game.size.x, game.size.y);
    return super.onLoad();
  }
}
