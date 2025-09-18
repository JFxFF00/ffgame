import 'dart:async';
import 'dart:math';

import 'package:ffgame/game.dart';
import 'package:ffgame/player.dart';
import 'package:flame/components.dart';

class Shadow extends SpriteComponent with HasGameReference<FFGame> {
  final Player player;
  Shadow({required this.player})
      : super(
          size: Vector2(84, 20),
          anchor: Anchor.topCenter,
        );

  Vector2 originalSize = Vector2(84, 20);

  @override
  FutureOr<void> onLoad() {
    sprite = Sprite(game.imageHolder.shadow);
    return super.onLoad();
  }

  @override
  void update(double dt) {
    super.update(dt);
    x = player.x;
    y = FFGame.groundYPosition;
    final distance = y - player.y;
    final maxDistance = 1000;
    final double modifier = max(0, 0.5 - (distance / maxDistance));
    final double modifier2 = max(0.3, 1 - (distance / maxDistance));
    opacity = modifier;
    size = originalSize * modifier2;
  }
}
