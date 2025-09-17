import 'package:ffgame/coin.dart';
import 'package:ffgame/enums.dart';
import 'package:ffgame/game.dart';
import 'package:ffgame/level.dart';
import 'package:ffgame/obstacle.dart';
import 'package:flame/components.dart';

class ObstacleManager extends PositionComponent with HasGameReference<FFGame> {
  ObstacleManager()
      : super(
          size: Vector2(0, 0),
          anchor: Anchor.bottomCenter,
          key: ComponentKey.named('obstacle_manager'),
        );
  double delay = 0;

  List<Obstacle> obstacles = [];
  List<Coin> coins = [];

  @override
  void update(double dt) {
    super.update(dt);
    if (game.gameState == GameState.scoreScreen) return;

    delay -= dt;
    if (delay <= 0) {
      final level = Level.fromInt(game.level);
      final challenge = level.spawnChallengesInto(game);
      delay = challenge.duration;
    }
  }

  void reset() {
    removeAll(children);
  }
}
