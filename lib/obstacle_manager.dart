import 'dart:math';

import 'package:ffgame/coin.dart';
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

  void _spawnObstacles() {
    var firstObstacle = Obstacle();
    var previousObstacle = firstObstacle;
    var allObstacles = [firstObstacle];
    var keepLooping = true;
    var loops = 1;
    var xPosition = 0.0;
    final startChance = -2.1;
    final addedChance = 0.4 * game.speed;
    print('Added chance: ' + addedChance.toString());
    double chance = startChance + addedChance;
    print('chance ' + chance.toString());
    // final a = 1 - GameBalance.obstacleDoubleChanceBase;
    // var chance = 1 - a * pow(e, -game.speed / 10);
    // print('Funy number: ' + pow(e, -game.speed / 10).toString());

    // print('Initial Chance ' + chance.toString());
    // print('gamespeed ' + game.speed.toString());
    while (keepLooping) {
      if (randomWithChance(chance)) {
        final obstacle = Obstacle();
        xPosition += previousObstacle.size.x * 0.7;
        obstacle.x = xPosition;
        allObstacles.add(obstacle);

        chance *= 0.7;
        // print('Updated chance (loop $loops): ' + chance.toString());

        previousObstacle = obstacle;
        loops++;
      } else {
        keepLooping = false;
      }

      obstacles.addAll(allObstacles);
      addAll(allObstacles);
    }
  }

  void reset() {
    removeAll(children);
  }
}
