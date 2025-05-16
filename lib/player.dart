import 'dart:async';
import 'package:ffgame/enums.dart';
import 'package:ffgame/game.dart';
import 'package:ffgame/helpers.dart';
import 'package:ffgame/obstacle.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

class Player extends SpriteComponent
    with HasGameReference<FFGame>, CollisionCallbacks {
  Player()
      : super(
          size: Vector2(64, 64),
          anchor: Anchor.center,
          key: ComponentKey.named('player'),
          children: [CircleHitbox()],
        );

  Stopwatch timer = Stopwatch();
  final maxTime = Duration(milliseconds: 200);

  double _yVelocity = 0;
  double _xVelocity = 0;
  double _gravity = .5;

  double _rotationSpeed = 0;

  double startYPos = 0;
  int framesPerJump = 0;

  PlayerState state = PlayerState.grounded;

  @override
  FutureOr<void> onLoad() {
    sprite = Sprite(game.imageHolder.characterImage);
    startYPos = position.y;
    print(position);
    return super.onLoad();
  }

  @override
  void update(double dt) {
    y += _yVelocity;
    x += _xVelocity;

    _updateState();

    // Extra jump height from holding button
    if (timer.isRunning && state.isJumping) {
      final timerJuice = ((maxTime - timer.elapsed).inMilliseconds / 1000)
          .clamp(0, double.infinity);
      _yVelocity += -5.0 * 120 * dt * timerJuice;
    }

    if (!state.isGrounded) {
      _yVelocity += _gravity;
      framesPerJump++;
    }

    if (state.isGrounded) {
      if (framesPerJump > 0) {
        framesPerJump = 0;
      }

      _yVelocity = 0;
    }

    final baseRotationSpeed = game.speed * 0.2;
    final differansen = _rotationSpeed - baseRotationSpeed;
    final shifterRotation = (differansen * 0.03).abs();
    _rotationSpeed = _rotationSpeed.moveTowardsValue(
      shifterRotation,
      baseRotationSpeed,
    );

    if (_xVelocity > 0) {
      _rotationSpeed += _xVelocity * 0.08;
    } else if (_xVelocity < 0) {
      _rotationSpeed += _xVelocity * 0.02;
    }

    angle += radiansFromDegrees(_rotationSpeed);

    super.update(dt);
  }

  void jump({double speed = 7}) {
    if (state.isGrounded) {
      timer.reset();
      _yVelocity = -speed;
      _rotationSpeed += 4.5;
      timer.start();
    }
  }

  void move({
    Direction direction = Direction.left,
    double speed = 1.7,
  }) {
    double modifiedSpeed = speed;
    if (!state.isGrounded) {
      modifiedSpeed = modifiedSpeed * 0.8;
    }
    _xVelocity = direction.isRight ? speed : -speed;
  }

  void stopTimer() {
    timer.stop();
  }

  void stop(Direction direction) {
    if (direction.isLeft && _xVelocity < 0) {
      _xVelocity = 0;
    } else if (direction.isRight && _xVelocity > 0) {
      _xVelocity = 0;
    }
  }

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);
    if (other is Obstacle) {
      game.end();
    }
  }

  void _updateState() {
    final movingUp = _yVelocity < 0;
    final movingDown = _yVelocity > 0;

    if (y < startYPos) {
      if (movingDown && !state.isGrounded) {
        state = PlayerState.falling;
      }

      if (movingUp) {
        state = PlayerState.jumping;
      }
    } else {
      y = startYPos;
      state = PlayerState.grounded;
      timer.reset();
    }

    angle += radiansFromDegrees(_rotationSpeed);
  }
}

enum PlayerState {
  jumping,
  grounded,
  falling,
}

extension PlayerStateExtension on PlayerState {
  bool get isJumping => this == PlayerState.jumping;
  bool get isGrounded => this == PlayerState.grounded;
  bool get isFalling => this == PlayerState.falling;
}
