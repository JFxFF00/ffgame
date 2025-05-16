import 'dart:async';

import 'package:ffgame/barrel.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/text.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';

class Coin extends SpriteAnimationComponent
    with HasGameReference<FFGame>, CollisionCallbacks {
  Coin()
      : super(
          anchor: Anchor.center,
          size: Vector2(48, 48),
        );

  bool get shouldDie => absolutePosition.x < (-game.size.x / 2);
  CircleHitbox circleHitbox = CircleHitbox();
  double _yVelocity = 0;
  double get value => 10.0 * (LoyaltyLevels.fromScore(game.score).index + 1);

  @override
  FutureOr<void> onLoad() async {
    final loadedAnimation = await game.loadSpriteAnimation(
      'coin.png',
      SpriteAnimationData.sequenced(
        amount: 6,
        stepTime: .2,
        textureSize: Vector2.all(512),
      ),
    );
    add(circleHitbox);
    animation = loadedAnimation;
    return super.onLoad();
  }

  @override
  void update(double dt) {
    super.update(dt);
    x -= game.speed;
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
      animation = null;
      game.score += value;

      FlameAudio.play('coin_pickup.mp3', volume: 0.7);
      Future.delayed(
        const Duration(milliseconds: 500),
        () => removeFromParent(),
      );
    }
    ;
  }
}
