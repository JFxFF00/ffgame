import 'package:ffgame/barrel.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class ObstacleManager extends PositionComponent with HasGameReference<FFGame> {
  ObstacleManager()
      : super(
          size: Vector2(0, 0),
          anchor: Anchor.bottomCenter,
          key: ComponentKey.named('obstacle_manager'),
        );
  double delay = 0;
  bool hasSpawnedInitialChallenge = false;

  @override
  void update(double dt) {
    super.update(dt);
    if (game.gameState == GameState.scoreScreen) return;

    delay -= dt;
    if (delay <= 0) {
      if (hasSpawnedInitialChallenge) {
        game.challengesCompleted++;
      }
      if (game.challengesCompleted >= GameBalance.challengesToNextLevel) {
        game.level++;
        game.challengesCompleted = 1;
      }
      final level = Level.fromInt(game.level);
      final challenge = level.spawnChallengesInto(game);
      debugPrint('Challenge: ${challenge.name}');
      if (challenge.name == null || challenge.name!.isEmpty) {
        game.challengeNameText.text = '[Unknown]';
      } else {
        game.challengeNameText.text = challenge.name!;
      }
      delay = challenge.duration;
      hasSpawnedInitialChallenge = true;
    }
  }

  void reset() {
    delay = 0;
    hasSpawnedInitialChallenge = false;
  }
}
