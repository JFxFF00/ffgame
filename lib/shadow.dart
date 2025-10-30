import 'dart:async';
import 'dart:math';

import 'package:ffgame/game.dart';
import 'package:ffgame/helpers.dart';
import 'package:ffgame/player.dart';
import 'package:flame/components.dart';
import 'package:flame/particles.dart';
import 'package:flutter/material.dart';

class Shadow extends SpriteComponent with HasGameReference<FFGame> {
  final Player player;
  Shadow({required this.player})
      : super(
          size: Vector2(84, 20),
          anchor: Anchor.topCenter,
        );

  Vector2 originalSize = Vector2(84, 20);

  final particleComponent = ParticleSystemComponent();
  double lifespan = 0;

  @override
  FutureOr<void> onLoad() {
    sprite = Sprite(game.imageHolder.shadow);
    add(particleComponent);
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
    if (lifespan > 0) {
      lifespan -= dt;
    }

    if (game.speedFromTrack > 1 && player.state.isGrounded) {
      if (lifespan <= 0) {
        particleComponent.particle = null;

        particleComponent.particle = Particle.generate(
          count: 10,
          generator: (i) => AcceleratedParticle(
            acceleration: Vector2(0.5, 0.5),
            speed: getParticleSpeed(),
            child: CircleParticle(
              radius: randomFromRange(0.1, 0.3),
              paint: Paint()..color = Colors.red,
            ),
            lifespan: 2,
          ),
        );
        lifespan = 0.5;
      }
    } else {
      particleComponent.particle = null;
    }
  }

  Vector2 getParticleSpeed() {
    final x = randomFromRange(-1, -40);
    final y = randomFromRange(-1, -40);
    return Vector2(x, y);
  }
}
