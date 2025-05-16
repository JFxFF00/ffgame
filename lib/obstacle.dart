import 'dart:async';

import 'package:ffgame/game.dart';
import 'package:ffgame/helpers.dart';
import 'package:ffgame/player.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

class Obstacle extends SpriteComponent
    with HasGameReference<FFGame>, CollisionCallbacks {
  Obstacle()
      : super(
          size: Vector2.all(randomFromRange(48, 64)),
          anchor: Anchor.bottomLeft,
          children: [
            CircleHitbox(),
          ],
        );

  bool get shouldDie => absolutePosition.x < (-game.size.x / 2);

  @override
  FutureOr<void> onLoad() {
    sprite = Sprite(game.imageHolder.obstacleImage);
    return super.onLoad();
  }

  @override
  void update(double dt) {
    super.update(dt);
    x -= game.speed;

    if (shouldDie) die();
  }

  void die() {
    removeFromParent();
  }

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);
    if (other is Player) removeFromParent();
  }
}
