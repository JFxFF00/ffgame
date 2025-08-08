import 'dart:math';

import 'package:ffgame/coin.dart';
import 'package:ffgame/enums.dart';
import 'package:ffgame/game.dart';
import 'package:ffgame/game_balance.dart';
import 'package:ffgame/helpers.dart';
import 'package:ffgame/obstacle.dart';
import 'package:flame/components.dart';

class ObstacleManager extends PositionComponent with HasGameReference<FFGame> {
  ObstacleManager()
      : super(
          size: Vector2(0, 0),
          anchor: Anchor.bottomCenter,
          key: ComponentKey.named('obstacle_manager'),
        );
  late World world;
  double delay = GameBalance.obstaclesBaseDelay;
  double coinDelay = 50;

  double get doubleChance => GameBalance.obstacleDoubleChanceBase;

  double get delayDecrease => game.speed * GameBalance.obstacleDelayDecrease;
  double get minDelay =>
      GameBalance.obstaclesBaseDelay * GameBalance.obstacleDelayVariation -
      delayDecrease;
  double get maxDelay =>
      GameBalance.obstaclesBaseDelay / GameBalance.obstacleDelayVariation -
      -delayDecrease;

  List<Obstacle> obstacles = [];
  List<Coin> coins = [];

  @override
  void update(double dt) {
    super.update(dt);
    if (game.gameState == GameState.scoreScreen) return;

    delay -= 1;
    coinDelay -= 1;

    if (delay <= 0) {
      _spawnObstacles();
      delay = randomFromRange(minDelay, maxDelay);
    }

    if (coinDelay <= 0) {
      coinDelay = randomFromRange(minDelay, maxDelay);
      var coin = Coin();
      coin.position.y = randomFromRange(-100, -200);

      coins.add(coin);
      add(coin);
    }
  }

  bool _kurva(int x) {
    ///todo m is at least 1
    final m = game.speed - GameBalance.gameSpeedBase;
    print('m ' + m.toStringAsFixed(2));

    final s = 2 / (2 * m + 1);
    // print('s ' + s.toStringAsFixed(2));

    final p = m;
    // print('p ' + p.toStringAsFixed(2));

    if (x < p) return true;

    double probability = pow(e, -s * (x - p)).toDouble();
    // print('probability ' + probability.toStringAsFixed(2));

    return randomWithChance(probability);
  }

  void _spawnObstacles() {
    Obstacle? previousObstacle;
    var allObstacles = <Obstacle>[];
    var xPosition = 0.0;

    var keepLooping = true;
    var loops = 0;

    while (keepLooping) {
      loops++;
      keepLooping = _kurva(loops);
    }

    // print('loops ' + loops.toString());

    for (int i = 0; i < loops; i++) {
      final obstacle = Obstacle();
      if (previousObstacle != null) {
        xPosition += previousObstacle.size.x * 0.7;
      }
      obstacle.x = xPosition;
      previousObstacle = obstacle;
      allObstacles.add(obstacle);
    }

    addAll(allObstacles);
  }

  void reset() {
    removeAll(children);
  }
}
