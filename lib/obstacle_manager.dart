import 'package:ffgame/game.dart';
import 'package:ffgame/helpers.dart';
import 'package:ffgame/obstacle.dart';
import 'package:flame/components.dart';

class ObstacleManager extends PositionComponent with HasGameRef<FFGame> {
  double delay = 100;
  late World world;
  double get frequencyIncrease => 3 + game.duration * 0.40;
  double get minFrequency => 100 - frequencyIncrease;
  double get maxFrequency => 200 - frequencyIncrease;
  List<Obstacle> obstacles = [];

  @override
  void update(double dt) {
    super.update(dt);

    delay -= 1;
    if (delay <= 0) {
      delay = randomFromRange(minFrequency, maxFrequency);
      var newObstacle = Obstacle();
      obstacles.add(newObstacle);
      add(newObstacle);
    }
  }

  void reset() {
    obstacles.forEach((element) {
      element.removeFromParent();
    });
  }
}
