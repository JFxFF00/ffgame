import 'dart:async';

import 'package:ffgame/game.dart';
import 'package:ffgame/helpers.dart';
import 'package:ffgame/play_area.dart';
import 'package:ffgame/player.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

class Obstacle extends SpriteComponent
    with HasGameRef<FFGame>, CollisionCallbacks {
  Obstacle()
      : super(
          size: Vector2(24, 24),
          anchor: Anchor.center,
          children: [
            CircleHitbox(),
          ],
        );

  bool get shouldDie => absolutePosition.x < (-game.size.x / 2);

  double get speed => 3 + game.duration * 0.15;

  @override
  FutureOr<void> onLoad() {
    sprite = Sprite(game.imageHolder.obstacleImage);
    size = Vector2.all(randomFromRange(20, 60));
    return super.onLoad();
  }

  @override
  void update(double dt) {
    super.update(dt);
    x -= speed;

    if (shouldDie) removeFromParent();
  }

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);
    if (other is Player) removeFromParent();
  }
}
