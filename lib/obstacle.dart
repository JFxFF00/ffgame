import 'dart:async';

import 'package:ffgame/game.dart';
import 'package:ffgame/player.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

class Obstacle extends SpriteComponent
    with HasGameReference<FFGame>, CollisionCallbacks {
  Obstacle()
      : super(
          size: Vector2.all(64),
          anchor: Anchor.bottomCenter,
          children: [
            CircleHitbox(),
          ],
        );

  bool get shouldDie => absolutePosition.x < (-game.size.x / 2);
  double _flipTimer = 0.0;
  bool _flipped = false;

  @override
  FutureOr<void> onLoad() {
    sprite = Sprite(game.imageHolder.obstacleImage);
    return super.onLoad();
  }

  @override
  void update(double dt) {
    super.update(dt);
    x -= game.speed * dt;

    // Flip every 0.3 seconds
    _flipTimer += dt;
    if (_flipTimer >= 0.3) {
      _flipped = !_flipped;
      scale.x = _flipped ? -1.0 : 1.0;
      _flipTimer = 0.0;
    }

    if (shouldDie) die();
  }

  void die() {
    removeFromParent();
  }

  @override
  void onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    super.onCollisionStart(intersectionPoints, other);
    if (other is Player) removeFromParent();
  }
}
