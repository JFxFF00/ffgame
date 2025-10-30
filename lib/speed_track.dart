import 'dart:async';

import 'package:ffgame/barrel.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

class SpeedTrack extends SpriteAnimationComponent
    with HasGameReference<FFGame>, CollisionCallbacks {
  SpeedTrack()
      : super(
          anchor: Anchor.bottomCenter,
          size: Vector2(128, 64),
        );

  bool get shouldDie => absolutePosition.x < (-game.size.x / 2);
  bool playerOnTrack = false;

  @override
  FutureOr<void> onLoad() async {
    animation = SpriteAnimation([
      SpriteAnimationFrame(Sprite(game.imageHolder.speedTrack1), 0.15),
      SpriteAnimationFrame(Sprite(game.imageHolder.speedTrack2), 0.15),
      SpriteAnimationFrame(Sprite(game.imageHolder.speedTrack3), 0.15),
      SpriteAnimationFrame(Sprite(game.imageHolder.speedTrack4), 0.15),
      SpriteAnimationFrame(Sprite(game.imageHolder.speedTrack5), 0.15),
    ]);
    add(RectangleHitbox());
    return super.onLoad();
  }

  @override
  void update(double dt) {
    super.update(dt);
    x -= game.speed * dt;
    if (playerOnTrack) {
      if (game.speedFromTrack == 1) {
        game.speedFromTrack = 1.3;
      }
      game.speedFromTrack += 3 * dt;
    }

    if (shouldDie) removeFromParent();
  }

  @override
  void onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    super.onCollisionStart(intersectionPoints, other);

    if (other is Player) {
      playerOnTrack = true;
      // SoundManager.playSound('coin_pickup.mp3');
      // Future.delayed(
      //   const Duration(milliseconds: 500),
      //   () => removeFromParent(),
      // );
    }
  }

  @override
  void onCollisionEnd(PositionComponent other) {
    super.onCollisionEnd(other);
    if (other is Player) {
      playerOnTrack = false;
    }
  }
}
