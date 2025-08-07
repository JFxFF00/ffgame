import 'dart:async';

import 'package:ffgame/game.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';

/// Generate a row of sprites along the x axis
class ParallaxController extends PositionComponent
    with HasGameReference<FlameGame> {
  final Vector2 eachSize;
  final Sprite sprite;
  final double speed;
  final double yPosition;
  final double xPosition;
  final double opacity;

  ParallaxController({
    required this.eachSize,
    required this.sprite,
    required this.speed,
    required this.yPosition,
    this.xPosition = 0,
    this.opacity = 1.0,
  });

  @override
  FutureOr<void> onLoad() {
    position.y = yPosition;
    position.x = xPosition;
    double maxLoops = 25;
    double pos = 0;
    while (maxLoops > 0 && pos < game.size.x + (eachSize.x * 3)) {
      add(Parallax(
        size: eachSize,
        sprite: sprite,
        speed: speed,
        position: Vector2(pos, 0),
      )..opacity = opacity);
      pos += eachSize.x - 2;
      maxLoops--;
    }

    return super.onLoad();
  }
}

class Parallax extends SpriteComponent with HasGameReference<FFGame> {
  Parallax({
    required super.size,
    required super.sprite,
    required super.position,
    required this.speed,
  });

  final double speed;

  @override
  void update(double dt) {
    position.x -= speed * game.speed;
    if (absolutePosition.x < -size.x) {
      position.x = game.size.x + size.x * 2;
    }
  }
}
