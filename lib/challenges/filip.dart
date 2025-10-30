import 'package:ffgame/challenge.dart';
import 'package:flame/components.dart';

abstract class Filip1 {
  static Challenge coinCollector() {
    return Challenge(name: 'Coin Collector', duration: 3, elements: [
      ChallengeElement.coin(Vector2(0, 0), amount: 20),
    ]);
  }

  static Challenge jumpOverCars() {
    return Challenge(name: 'Jump Over Cars', duration: 4, elements: [
      ChallengeElement.obstacle(0, size: 1.2),
      ChallengeElement.obstacle(600, amount: 2),
      ChallengeElement.obstacle(1200, amount: 3, size: 0.7),
    ]);
  }
}

abstract class Filip2 {
  static Challenge crazyFrog() {
    return Challenge(name: 'Crazy Frog', duration: 5, elements: [
      ChallengeElement.coin(Vector2(0, 0), amount: 7),
      ChallengeElement.obstacle(600, amount: 18, size: 0.3),
      ChallengeElement.obstacle(1300, size: 3),
    ]);
  }

  static Challenge runAndJump() {
    return Challenge(name: 'Run and Jump', duration: 5, elements: [
      ChallengeElement.coin(Vector2(0, 0)),
      ChallengeElement.obstacle(500),
      ChallengeElement.coin(Vector2(400, -200)),
      ChallengeElement.obstacle(1000, size: 1.5),
      ChallengeElement.coin(Vector2(900, -250)),
      ChallengeElement.obstacle(1500, size: 2),
      ChallengeElement.coin(Vector2(1480, -300)),
    ]);
  }
}

abstract class Filip3 {
  static Challenge speedRun() {
    return Challenge(name: 'Speed Run', duration: 5, elements: [
      ChallengeElement.bird(Vector2(0, -200)),
      ChallengeElement.obstacle(0, size: 1),
      ChallengeElement.coin(Vector2(240, 0)),
      ChallengeElement.obstacle(400, size: 2),
      ChallengeElement.coin(Vector2(700, 0)),
      ChallengeElement.obstacle(800, size: 1.5),
    ]);
  }

  static Challenge birdChallenge() {
    return Challenge(name: 'Bird Challenge', duration: 5, elements: [
      ChallengeElement.bird(Vector2(0, -300)),
      ChallengeElement.cash(Vector2(0, -100)),
      ChallengeElement.bird(Vector2(200, -300)),
      ChallengeElement.cash(Vector2(200, -100)),
      ChallengeElement.bird(Vector2(400, -300)),
      ChallengeElement.cash(Vector2(400, -100)),
      ChallengeElement.bird(Vector2(600, -300)),
      ChallengeElement.bird(Vector2(800, -300)),
      ChallengeElement.coin(Vector2(900, 0), amount: 3),
      ChallengeElement.bird(Vector2(1000, -300)),
      ChallengeElement.bird(Vector2(1200, -50)),
    ]);
  }
}

abstract class Filip4 {
  static Challenge dodgeAndCollect() {
    return Challenge(name: 'Dodge and Collect', duration: 5, elements: [
      ChallengeElement.obstacle(0),
      ChallengeElement.obstacle(400),
      ChallengeElement.bird(Vector2(400, -100)),
      ChallengeElement.cash(Vector2(640, 0)),
      ChallengeElement.obstacle(800),
      ChallengeElement.obstacle(1200),
      ChallengeElement.bird(Vector2(1200, -100)),
    ]);
  }

  static Challenge timeTrial() {
    return Challenge(name: 'Time Trial', duration: 6, elements: [
      ChallengeElement.obstacle(0, size: 1.5),
      ChallengeElement.coin(Vector2(300, 0), amount: 5),
      ChallengeElement.obstacle(600, amount: 2),
      ChallengeElement.coin(Vector2(800, 0), amount: 5),
      ChallengeElement.bird(Vector2(1000, -100)),
      ChallengeElement.obstacle(1200, size: 2),
      ChallengeElement.coin(Vector2(1400, 0), amount: 5),
      ChallengeElement.obstacle(1800, amount: 3),
    ]);
  }
}

abstract class Filip5 {
  static Challenge ultimateChallenge() {
    return Challenge(name: 'Ultimate Challenge', duration: 7, elements: [
      ChallengeElement.obstacle(0),
      ChallengeElement.obstacle(300),
      ChallengeElement.bird(Vector2(300, -100)),
      ChallengeElement.cash(Vector2(400, -200)),
      ChallengeElement.obstacle(600),
      ChallengeElement.obstacle(900),
      ChallengeElement.bird(Vector2(1000, -100)),
      ChallengeElement.cash(Vector2(1100, -100)),
      ChallengeElement.obstacle(1200, amount: 2),
      ChallengeElement.obstacle(1500, size: 2),
      ChallengeElement.obstacle(1800, amount: 3),
      ChallengeElement.obstacle(2100, size: 2.3),
      ChallengeElement.cash(Vector2(2000, -300), amount: 3),
    ]);
  }

  static Challenge longJumpChallenge() {
    return Challenge(name: 'Long Jump Challenge', duration: 5, elements: [
      ChallengeElement.obstacle(0, size: 3),
      ChallengeElement.bird(Vector2(60, -300)),
      ChallengeElement.coin(Vector2(400, -150)),
      ChallengeElement.cash(Vector2(500, -200)),
      ChallengeElement.coin(Vector2(600, -150)),
      ChallengeElement.bird(Vector2(800, -50)),
      ChallengeElement.obstacle(880, size: 0.4),
      ChallengeElement.obstacle(1000, size: 2, amount: 3),
      ChallengeElement.obstacle(1340, size: 0.4),
      ChallengeElement.cash(Vector2(1480, -70)),
      ChallengeElement.obstacle(1600, size: 0.4),
    ]);
  }
}

abstract class Filip6 {
  static Challenge speedRunWithCars() {
    return Challenge(name: 'Speed Run with Cars', duration: 5, elements: [
      ChallengeElement.coin(Vector2(0, 0), amount: 3),
      ChallengeElement.obstacle(200),
      ChallengeElement.bird(Vector2(200, -100)),
      ChallengeElement.cash(Vector2(600, -200)),
      ChallengeElement.obstacle(500, amount: 2),
      ChallengeElement.bird(Vector2(700, -400)),
      ChallengeElement.obstacle(800, size: 2),
      ChallengeElement.bird(Vector2(800, -450)),
      ChallengeElement.cash(Vector2(800, -400)),
      ChallengeElement.bird(Vector2(1000, -100)),
      ChallengeElement.obstacle(1200, amount: 3),
      ChallengeElement.bird(Vector2(1200, -200)),
      ChallengeElement.bird(Vector2(1300, -100)),
      ChallengeElement.cash(Vector2(1460, 0)),
      ChallengeElement.obstacle(1600, size: 2.5),
    ]);
  }

  static Challenge mixedChallenge() {
    return Challenge(name: 'Mixed Challenge', duration: 7, elements: [
      ChallengeElement.cash(Vector2(0, 0), amount: 2),
      ChallengeElement.obstacle(200, size: 1),
      ChallengeElement.bird(Vector2(200, -130)),
      ChallengeElement.bird(Vector2(240, -200)),
      ChallengeElement.bird(Vector2(280, -300)),
      ChallengeElement.cash(Vector2(320, 0)),
      ChallengeElement.bird(Vector2(400, -300)),
      ChallengeElement.obstacle(440),
      ChallengeElement.cash(Vector2(540, 0)),
      ChallengeElement.obstacle(660, amount: 2),
      ChallengeElement.cash(Vector2(860, 0)),
      ChallengeElement.bird(Vector2(1000, -300)),
      ChallengeElement.obstacle(1100, amount: 2, size: 1.5),
      ChallengeElement.cash(Vector2(1400, 0)),
      ChallengeElement.obstacle(1540, size: 2),
      ChallengeElement.cash(Vector2(1740, 0)),
      ChallengeElement.obstacle(1880, amount: 3),
      ChallengeElement.obstacle(2200, size: 2.5),
    ]);
  }
}

abstract class FilipChallenge {
  static Challenge sockervadd() {
    return Challenge(
      name: 'Sockervadd',
      duration: 10,
      elements: [
        ChallengeElement.speedBoost(0, amount: 80),
        ChallengeElement.obstacle(22000, amount: 36),
        ChallengeElement.coin(Vector2(1000, -100),
            amount: 80, verticalAmount: 3, gap: 75),
      ],
    );
  }

  static Challenge gullig() {
    return Challenge(
      name: 'Gullig',
      duration: 10,
      elements: [
        ChallengeElement.obstacle(
          0,
          amount: 5,
          verticalAmount: 2,
          gap: 300,
          verticalGap: 200,
        ),
        ChallengeElement.obstacle(
          0,
          y: 125,
          amount: 3,
          gap: 664,
        ),
        ChallengeElement.coin(
          Vector2(3200, -100),
          verticalAmount: 5,
        ),
        ChallengeElement.cash(
          Vector2(3200, -350),
        ),
        ChallengeElement.coin(Vector2(3600, 0), amount: 3),
        ChallengeElement.speedBoost(4000, amount: 3),
        ChallengeElement.obstacle(4800),
        ChallengeElement.coin(Vector2(5200, 0), amount: 3),
        ChallengeElement.speedBoost(5600, amount: 3),
        ChallengeElement.obstacle(6400),
        ChallengeElement.coin(Vector2(6800, 0), amount: 3),
        ChallengeElement.speedBoost(7200, amount: 3),
        ChallengeElement.obstacle(8000),
      ],
    );
  }
}
