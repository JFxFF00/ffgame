import 'dart:async';

import 'package:ffgame/barrel.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/text.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';

class Cash extends SpriteComponent
    with HasGameReference<FFGame>, CollisionCallbacks {
  Cash()
      : super(
          anchor: Anchor.bottomCenter,
          size: Vector2(64, 64),
        );

  bool get shouldDie => absolutePosition.x < (-game.size.x / 2);
  CircleHitbox circleHitbox = CircleHitbox();
  double _yVelocity = 0;
  double get value => 50.0;
  //* (LoyaltyLevels.fromScore(game.scoreManager.score).index + 1);

  @override
  FutureOr<void> onLoad() async {
    add(circleHitbox);
    sprite = Sprite(game.imageHolder.cash);
    return super.onLoad();
  }

  @override
  void update(double dt) {
    super.update(dt);
    x -= game.speed * dt;
    y += _yVelocity;

    if (shouldDie) removeFromParent();
  }

  @override
  void onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    super.onCollisionStart(intersectionPoints, other);

    if (other is Player) {
      final regular = TextPaint(
        style: TextStyle(
          fontSize: 22.0,
          letterSpacing: 1.5,
          color: Color.fromARGB(255, 221, 255, 214),
          fontWeight: FontWeight.bold,
        ),
      );

      add(TextComponent(text: '+$value', textRenderer: regular));
      _yVelocity = -1;
      remove(circleHitbox);
      game.scoreManager.addScore(value, fromCoin: true);
      sprite = null;

      SoundManager.playSound('coin_pickup.mp3');
      Future.delayed(
        const Duration(milliseconds: 500),
        () => removeFromParent(),
      );
    }
  }
}
