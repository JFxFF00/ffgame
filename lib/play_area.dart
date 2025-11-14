import 'dart:async';

import 'package:ffgame/barrel.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/particles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class PlayArea extends RectangleComponent
    with TapCallbacks, HasGameReference<FFGame> {
  PlayArea()
      : super(
          paint: Paint()..color = Color(0xff123826),
          children: [],
        );

  double speedParticleDelay = 0;

  @override
  FutureOr<void> onLoad() {
    size = Vector2(game.size.x, game.size.y);
    add(ParallaxController(
      eachSize: Vector2((FFGame.groundYPosition) * 2, FFGame.groundYPosition),
      sprite: Sprite(game.imageHolder.sky),
      speed: 0.005,
      yPosition: 0,
    ));
    add(ParallaxController(
      eachSize: Vector2(FFGame.groundYPosition * 2, FFGame.groundYPosition),
      sprite: Sprite(game.imageHolder.sky),
      speed: 0.005,
      yPosition: 0,
      opacity: 0.4,
    ));
    add(ParallaxController(
      eachSize: Vector2(600, 300),
      sprite: Sprite(game.imageHolder.buildings1),
      speed: 0.06,
      xPosition: 100,
      yPosition: FFGame.groundYPosition - 300,
    ));
    add(ParallaxController(
      eachSize: Vector2(FFGame.groundYPosition * 2, FFGame.groundYPosition),
      sprite: Sprite(game.imageHolder.sky),
      speed: 0.005,
      yPosition: 0,
      opacity: 0.4,
    ));
    add(ParallaxController(
      eachSize: Vector2(1000, 500),
      sprite: Sprite(game.imageHolder.buildings1),
      speed: 0.08,
      xPosition: -100,
      yPosition: FFGame.groundYPosition - 500,
    ));
    add(ParallaxController(
      eachSize: Vector2(FFGame.groundYPosition * 2, FFGame.groundYPosition),
      sprite: Sprite(game.imageHolder.sky),
      speed: 0.005,
      yPosition: 0,
      opacity: 0.4,
    ));
    add(ParallaxController(
      eachSize: Vector2(1400, 700),
      sprite: Sprite(game.imageHolder.buildings1),
      speed: 0.14,
      xPosition: 300,
      yPosition: FFGame.groundYPosition - 700,
    ));
    add(ParallaxController(
      eachSize: Vector2(1024, 512),
      sprite: Sprite(game.imageHolder.grass),
      speed: 1,
      yPosition: FFGame.groundYPosition - 130,
    ));

    return super.onLoad();
  }

  @override
  void update(double dt) {
    if (speedParticleDelay > 0) {
      speedParticleDelay -= dt;
    }

    if (game.speedFromTrack > 1 && game.player.state.isGrounded) {
      if (speedParticleDelay <= 0) {
        add(ParticleSystemComponent(
          position: game.player.position + Vector2(0, game.player.height / 2),
          particle: Particle.generate(
            count: (4 * game.speedFromTrack).round(),
            generator: (i) => AcceleratedParticle(
              acceleration: Vector2(0.8, 0.8),
              speed: getParticleSpeed() * game.speedFromTrack,
              child: SpeedParticle(
                radius: randomFromRange(3, 5),
                color: getParticleColor(),
              ),
              lifespan: 2,
            ),
          ),
        ));

        speedParticleDelay = 0.05;
      }
    } else {
      // removeWhere((child) => child is ParticleSystemComponent);
    }
    super.update(dt);
  }

  Vector2 getParticleSpeed() {
    final x = randomFromRange(-400, -550);
    final y = randomFromRange(-1, -40);
    return Vector2(x, y);
  }

  Color getParticleColor() {
    if (randomWithChance(0.60)) {
      return const Color.fromARGB(255, 229, 92, 74);
    }
    if (randomWithChance(0.33)) {
      return const Color.fromARGB(255, 224, 187, 93);
    }
    return const Color.fromARGB(255, 243, 236, 225);
  }
}

class SpeedParticle extends Particle {
  final Color color;
  final double radius;
  SpeedParticle({required this.color, required this.radius});

  double radiusMultiplier = 1;
  double opacityMultiplier = 1;

  @override
  void render(Canvas canvas) {
    canvas.drawCircle(
      Offset.zero,
      radiusMultiplier * radius,
      Paint()..color = color.withAlpha((opacityMultiplier * 255).round()),
    );
  }

  @override
  void update(double dt) {
    super.update(dt);
    final shrinkage = 0.9 * dt;
    radiusMultiplier -= shrinkage;
    opacityMultiplier -= shrinkage;
  }
}
