import 'dart:async';
import 'package:ffgame/game.dart';
import 'package:ffgame/helpers.dart';
import 'package:ffgame/obstacle.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

enum PlayerState {
  jumping,
  grounded,
}

extension PlayerStateExtension on PlayerState {
  bool get isGrounded => this == PlayerState.grounded;
}

class Player extends SpriteComponent
    with HasGameReference<FFGame>, CollisionCallbacks {
  Player()
      : super(
            size: Vector2(64, 64),
            anchor: Anchor.center,
            key: ComponentKey.named('player'),
            children: [RectangleHitbox()]);

  double _yVelocity = 0;
  double _gravity = .5;

  double _rotationSpeed = 0;

  double get groundYPos => game.size.y / 2;
  int framesPerJump = 0;

  PlayerState state = PlayerState.grounded;

  @override
  FutureOr<void> onLoad() {
    sprite = Sprite(game.imageHolder.characterImage);

    return super.onLoad();
  }

  @override
  void update(double dt) {
    y += _yVelocity;
    if (y < 0) {
      _yVelocity += _gravity;
      state = PlayerState.jumping;
      framesPerJump++;
    } else {
      if (framesPerJump > 0) {
        framesPerJump = 0;
      }
      _yVelocity = 0;
      _rotationSpeed = 0;
      state = PlayerState.grounded;
    }

    angle += radiansFromDegrees(_rotationSpeed);

    super.update(dt);
  }

  void jump({double speed = 15}) {
    if (state.isGrounded) {
      _yVelocity = -speed;
      _rotationSpeed = 4.5;
    }
  }

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);
    if (other is Obstacle) {
      print('Your final score is: ${game.duration.round()}');
      game.pauseEngine();
      Future.delayed(Duration(seconds: 3))
        ..then((_) {
          game.resumeEngine();
          game.restart();
        });
    }
  }
}
