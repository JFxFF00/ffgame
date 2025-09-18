import 'package:ffgame/challenge.dart';
import 'package:flame/components.dart';

abstract class JhonChloo {
  static Challenge death() {
    return Challenge(
      duration: 4,
      elements: [
        ChallengeElement.obstacle(100, size: 15),
      ],
    );
  }

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
      duration: 6,
      elements: [
        ChallengeElement.obstacle(100),
        ChallengeElement.coin(Vector2(250, -90)),
        ChallengeElement.obstacle(400, amount: 2),
        ChallengeElement.obstacle(650, size: 2.4),
        ChallengeElement.coin(Vector2(690, -300)),
        ChallengeElement.obstacle(900, amount: 2),
        ChallengeElement.obstacle(1200, amount: 3, size: 0.9),
      ],
    );
  }

  static Challenge three() {
    return Challenge(
      duration: 4,
      elements: [
        ChallengeElement.obstacle(100, size: 1.5),
        ChallengeElement.coin(Vector2(250, -90)),
        ChallengeElement.obstacle(450, size: 1.5),
        ChallengeElement.obstacle(700, amount: 4, size: 0.9),
      ],
    );
  }

  static Challenge four() {
    return Challenge(
      duration: 4,
      elements: [
        ChallengeElement.obstacle(0, size: 1.5),
        ChallengeElement.obstacle(230, amount: 4),
        ChallengeElement.coin(Vector2(240, -200)),
        ChallengeElement.coin(Vector2(280, -230)),
        ChallengeElement.coin(Vector2(320, -200)),
        ChallengeElement.obstacle(580, amount: 2, size: 1.3),
        ChallengeElement.coin(Vector2(590, -325), amount: 2),
      ],
    );
  }
}

abstract class JhonChloo2 {
  static Challenge one() {
    return Challenge(
      duration: 4,
      elements: [
        ChallengeElement.bird(Vector2(100, -100)),
        ChallengeElement.obstacle(200, amount: 4),
        ChallengeElement.bird(Vector2(750, -50)),
        ChallengeElement.coin(Vector2(500, -200)),
        ChallengeElement.bird(Vector2(750, -450)),
      ],
    );
  }

  static Challenge two() {
    return Challenge(
      duration: 4,
      elements: [
        ChallengeElement.obstacle(0, size: 2),
        ChallengeElement.obstacle(280),
        ChallengeElement.obstacle(310, size: 2),
        ChallengeElement.obstacle(380, amount: 2),
        ChallengeElement.coin(Vector2(260, -10)),
        ChallengeElement.coin(Vector2(490, -10)),
        ChallengeElement.bird(Vector2(900, -150)),
        ChallengeElement.coin(Vector2(700, -300)),
      ],
    );
  }

  static Challenge three() {
    return Challenge(
      duration: 4,
      elements: [
        ChallengeElement.obstacle(0, amount: 5, size: 0.8),
        ChallengeElement.obstacle(280, amount: 2, size: 1.5),
        ChallengeElement.coin(Vector2(330, -250)),
        ChallengeElement.obstacle(600, amount: 2),
        ChallengeElement.coin(Vector2(630, -150)),
        ChallengeElement.bird(Vector2(850, -350)),
      ],
    );
  }
}

abstract class JhonChloo4 {
  static Challenge one() {
    return Challenge(
      duration: 4,
      elements: [
        ChallengeElement.obstacle(50, amount: 3),
        ChallengeElement.bird(Vector2(100, -350)),
        ChallengeElement.bird(Vector2(200, -350)),
        ChallengeElement.obstacle(400, size: 2),
        ChallengeElement.bird(Vector2(550, -350)),
        ChallengeElement.bird(Vector2(650, -350)),
        ChallengeElement.bird(Vector2(700, -100)),
      ],
    );
  }
}
