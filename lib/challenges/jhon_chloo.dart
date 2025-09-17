import 'package:ffgame/challenge.dart';
import 'package:flame/components.dart';

abstract class JhonChloo {
  static Challenge one() {
    return Challenge(
      duration: 5.5,
      elements: [
        ChallengeElement.coin(Vector2(100, -100)),
        ChallengeElement.obstacle(170),
        ChallengeElement.obstacle(200, size: 1.5),
        ChallengeElement.obstacle(250),
        ChallengeElement.coin(Vector2(310, 0)),
        ChallengeElement.obstacle(450, amount: 3),
        ChallengeElement.coin(Vector2(600, -120)),
        ChallengeElement.obstacle(800),
        ChallengeElement.obstacle(1000),
        ChallengeElement.obstacle(1200),
      ],
    );
  }

  static Challenge two() {
    return Challenge(
      duration: 5,
      elements: [
        ChallengeElement.obstacle(100),
        ChallengeElement.coin(Vector2(250, -90)),
        ChallengeElement.obstacle(400, amount: 2),
        ChallengeElement.obstacle(650, size: 2.4),
        ChallengeElement.coin(Vector2(690, -300)),
        ChallengeElement.obstacle(900, amount: 2),
        ChallengeElement.obstacle(1200, amount: 2),
      ],
    );
  }
}
