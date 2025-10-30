import 'package:ffgame/barrel.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class ObstacleManager extends PositionComponent with HasGameReference<FFGame> {
  final Challenge? challenge;
  ObstacleManager({this.challenge})
      : super(
          size: Vector2(0, 0),
          anchor: Anchor.bottomCenter,
          key: ComponentKey.named('obstacle_manager'),
        );
  double delay = 0;

  @override
  void update(double dt) {
    super.update(dt);
    if (game.gameState == GameState.scoreScreen) return;

    delay -= dt;
    if (delay <= 0) {
      int challengesToComplete = GameBalance.challengesToNextLevel;
      game.challengesCompleted++;

      if (game.level == 1) {
        challengesToComplete = GameBalance.challengesOnLevel1;
      }
      if (game.challengesCompleted >= challengesToComplete) {
        game.level++;
        game.challengesCompleted = 1;
      }

      final level = Level.fromInt(game.level);
      final challenge = spawnChallenge();
      debugPrint('Challenge: ${challenge.name}');
      if (challenge.name == null || challenge.name!.isEmpty) {
        game.challengeNameText.text = '[Unknown]';
      } else {
        game.challengeNameText.text = challenge.name!;
      }
      delay = challenge.duration;
      game.speedFromLevel = level.speed;
    }
  }

  Challenge spawnChallenge() {
    if (challenge != null) {
      challenge!.spawnInto(game);
      return challenge!;
    }
    final level = Level.fromInt(game.level);
    return level.spawnChallengesInto(game);
  }

  void reset() {
    delay = 0;
  }
}
