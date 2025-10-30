import 'dart:async';

import 'package:ffgame/barrel.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/text.dart';
import 'package:flutter/material.dart';

class Starman extends SpriteComponent
    with HasGameReference<FFGame>, CollisionCallbacks {
  Starman()
      : super(
          anchor: Anchor.bottomCenter,
          size: Vector2(48, 48),
        );

  bool get shouldDie => absolutePosition.x < (-game.size.x / 2);
  CircleHitbox circleHitbox = CircleHitbox();

  @override
  FutureOr<void> onLoad() async {
    add(circleHitbox);
    sprite = Sprite(game.imageHolder.starman);
    return super.onLoad();
  }

  @override
  void update(double dt) {
    super.update(dt);
    x -= game.speed * dt;

    if (shouldDie) removeFromParent();
  }

  @override
  void onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    super.onCollisionStart(intersectionPoints, other);

    if (other is Player) {
      other.juice();
      removeFromParent();
    }
  }
}
