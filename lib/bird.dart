import 'dart:async';
import 'dart:math';

import 'package:ffgame/barrel.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

class Bird extends SpriteAnimationComponent
    with HasGameReference<FFGame>, CollisionCallbacks {
  Bird()
      : super(
          size: Vector2.all(80),
          anchor: Anchor.center,
          children: [
            RectangleHitbox(size: Vector2(80, 20), position: Vector2(0, 30)),
          ],
        );

  bool get shouldDie => absolutePosition.x < (-game.size.x / 2);
  double speed = 100;
  double bobSpeed = 2;
  double bobHeight = 40;
  double bobOffset = 0;

  @override
  FutureOr<void> onLoad() {
    final frame1 = randomFromRange(0.7, 1.0);
    animation = SpriteAnimation([
      SpriteAnimationFrame(Sprite(game.imageHolder.birdFly1), frame1),
      SpriteAnimationFrame(Sprite(game.imageHolder.birdFly2), 0.1),
      SpriteAnimationFrame(Sprite(game.imageHolder.birdFly3), 0.3),
    ]);

    bobOffset = randomFromRange(0, 100);
    return super.onLoad();
  }

  @override
  void update(double dt) {
    super.update(dt);
    x -= (game.speed + speed) * dt;
    y += sin((game.duration + bobOffset) * bobSpeed) * bobHeight * dt;

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
