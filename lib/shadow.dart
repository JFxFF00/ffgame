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
  double particleDelay = 0;

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
    if (particleDelay > 0) {
      particleDelay -= dt;
    }

    // if (game.speedFromTrack > 1 && player.state.isGrounded) {
    //   if (particleDelay <= 0) {
    //     add(ParticleSystemComponent(
    //       position: Vector2(38, 0),
    //       particle: Particle.generate(
    //         count: 12,
    //         generator: (i) => AcceleratedParticle(
    //           acceleration: Vector2(0.8, 0.8),
    //           speed: getParticleSpeed(),
    //           child: CircleParticle(
    //             radius: randomFromRange(0.8, 1.7),
    //             paint: Paint()..color = getParticleColor(),
    //           ),
    //           lifespan: 2,
    //         ),
    //       ),
    //     ));

    //     particleDelay = 0.3;
    //   }
    // } else {
    //   removeWhere((child) => child is ParticleSystemComponent);
    // }
  }

  Vector2 getParticleSpeed() {
    final x = randomFromRange(-100, -400);
    final y = randomFromRange(-1, -40);
    return Vector2(x, y);
  }

  Color getParticleColor() {
    if (randomWithChance(0.33)) {
      return Colors.yellow;
    }
    if (randomWithChance(0.33)) {
      return Colors.white;
    }
    return Colors.red;
  }
}
