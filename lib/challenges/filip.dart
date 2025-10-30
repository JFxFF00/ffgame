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
      ChallengeElement.obstacle(300, amount: 2),
      ChallengeElement.obstacle(600, amount: 3, size: 0.7),
    ]);
  }
}

abstract class Filip2 {
  static Challenge crazyFrog() {
    return Challenge(name: 'Crazy Frog', duration: 5, elements: [
      ChallengeElement.coin(Vector2(0, 0), amount: 7),
      ChallengeElement.obstacle(300, amount: 18, size: 0.3),
      ChallengeElement.obstacle(650, size: 3),
    ]);
  }

  static Challenge runAndJump() {
    return Challenge(name: 'Run and Jump', duration: 5, elements: [
      ChallengeElement.coin(Vector2(0, 0)),
      ChallengeElement.obstacle(250),
      ChallengeElement.coin(Vector2(200, -200)),
      ChallengeElement.obstacle(500, size: 1.5),
      ChallengeElement.coin(Vector2(450, -250)),
      ChallengeElement.obstacle(750, size: 2),
      ChallengeElement.coin(Vector2(740, -300)),
    ]);
  }
}

abstract class Filip3 {
  static Challenge speedRun() {
    return Challenge(name: 'Speed Run', duration: 5, elements: [
      ChallengeElement.bird(Vector2(0, -200)),
      ChallengeElement.obstacle(0, size: 1),
      ChallengeElement.coin(Vector2(120, 0)),
      ChallengeElement.obstacle(200, size: 2),
      ChallengeElement.coin(Vector2(350, 0)),
      ChallengeElement.obstacle(400, size: 1.5),
    ]);
  }

  static Challenge birdChallenge() {
    return Challenge(name: 'Bird Challenge', duration: 5, elements: [
      ChallengeElement.bird(Vector2(0, -300)),
      ChallengeElement.cash(Vector2(0, -100)),
      ChallengeElement.bird(Vector2(100, -300)),
      ChallengeElement.cash(Vector2(100, -100)),
      ChallengeElement.bird(Vector2(200, -300)),
      ChallengeElement.cash(Vector2(200, -100)),
      ChallengeElement.bird(Vector2(300, -300)),
      ChallengeElement.bird(Vector2(400, -300)),
      ChallengeElement.coin(Vector2(450, 0), amount: 3),
      ChallengeElement.bird(Vector2(500, -300)),
      ChallengeElement.bird(Vector2(600, -50)),
    ]);
  }
}

abstract class Filip4 {
  static Challenge dodgeAndCollect() {
    return Challenge(name: 'Dodge and Collect', duration: 5, elements: [
      ChallengeElement.obstacle(0),
      ChallengeElement.obstacle(200),
      ChallengeElement.bird(Vector2(200, -100)),
      ChallengeElement.cash(Vector2(320, 0)),
      ChallengeElement.obstacle(400),
      ChallengeElement.obstacle(600),
      ChallengeElement.bird(Vector2(600, -100)),
    ]);
  }

  static Challenge timeTrial() {
    return Challenge(name: 'Time Trial', duration: 6, elements: [
      ChallengeElement.obstacle(0, size: 1.5),
      ChallengeElement.coin(Vector2(150, 0), amount: 5),
      ChallengeElement.obstacle(300, amount: 2),
      ChallengeElement.coin(Vector2(400, 0), amount: 5),
      ChallengeElement.bird(Vector2(500, -100)),
      ChallengeElement.obstacle(600, size: 2),
      ChallengeElement.coin(Vector2(700, 0), amount: 5),
      ChallengeElement.obstacle(900, amount: 3),
    ]);
  }
}

abstract class Filip5 {
  static Challenge ultimateChallenge() {
    return Challenge(name: 'Ultimate Challenge', duration: 7, elements: [
      ChallengeElement.obstacle(0),
      ChallengeElement.obstacle(150),
      ChallengeElement.bird(Vector2(150, -100)),
      ChallengeElement.cash(Vector2(200, -200)),
      ChallengeElement.obstacle(300),
      ChallengeElement.obstacle(450),
      ChallengeElement.bird(Vector2(500, -100)),
      ChallengeElement.cash(Vector2(550, -100)),
      ChallengeElement.obstacle(600, amount: 2),
      ChallengeElement.obstacle(750, size: 2),
      ChallengeElement.obstacle(900, amount: 3),
      ChallengeElement.obstacle(1050, size: 2.3),
      ChallengeElement.cash(Vector2(1000, -300), amount: 3),
    ]);
  }

  static Challenge longJumpChallenge() {
    return Challenge(name: 'Long Jump Challenge', duration: 5, elements: [
      ChallengeElement.obstacle(0, size: 3),
      ChallengeElement.bird(Vector2(30, -300)),
      ChallengeElement.coin(Vector2(200, -150)),
      ChallengeElement.cash(Vector2(250, -200)),
      ChallengeElement.coin(Vector2(300, -150)),
      ChallengeElement.bird(Vector2(400, -50)),
      ChallengeElement.obstacle(440, size: 0.4),
      ChallengeElement.obstacle(500, size: 2, amount: 3),
      ChallengeElement.obstacle(670, size: 0.4),
      ChallengeElement.cash(Vector2(740, -70)),
      ChallengeElement.obstacle(800, size: 0.4),
    ]);
  }
}

abstract class Filip6 {
  static Challenge speedRunWithCars() {
    return Challenge(name: 'Speed Run with Cars', duration: 5, elements: [
      ChallengeElement.coin(Vector2(0, 0), amount: 3),
      ChallengeElement.obstacle(100),
      ChallengeElement.bird(Vector2(100, -100)),
      ChallengeElement.cash(Vector2(300, -200)),
      ChallengeElement.obstacle(250, amount: 2),
      ChallengeElement.bird(Vector2(350, -400)),
      ChallengeElement.obstacle(400, size: 2),
      ChallengeElement.bird(Vector2(400, -450)),
      ChallengeElement.cash(Vector2(400, -400)),
      ChallengeElement.bird(Vector2(500, -100)),
      ChallengeElement.obstacle(600, amount: 3),
      ChallengeElement.bird(Vector2(600, -200)),
      ChallengeElement.bird(Vector2(650, -100)),
      ChallengeElement.cash(Vector2(730, 0)),
      ChallengeElement.obstacle(800, size: 2.5),
    ]);
  }

  static Challenge mixedChallenge() {
    return Challenge(name: 'Mixed Challenge', duration: 7, elements: [
      ChallengeElement.cash(Vector2(0, 0), amount: 2),
      ChallengeElement.obstacle(100, size: 1),
      ChallengeElement.bird(Vector2(100, -130)),
      ChallengeElement.bird(Vector2(120, -200)),
      ChallengeElement.bird(Vector2(140, -300)),
      ChallengeElement.cash(Vector2(160, 0)),
      ChallengeElement.bird(Vector2(200, -300)),
      ChallengeElement.obstacle(220),
      ChallengeElement.cash(Vector2(270, 0)),
      ChallengeElement.obstacle(330, amount: 2),
      ChallengeElement.cash(Vector2(430, 0)),
      ChallengeElement.bird(Vector2(500, -300)),
      ChallengeElement.obstacle(550, amount: 2, size: 1.5),
      ChallengeElement.cash(Vector2(700, 0)),
      ChallengeElement.obstacle(770, size: 2),
      ChallengeElement.cash(Vector2(870, 0)),
      ChallengeElement.obstacle(940, amount: 3),
      ChallengeElement.obstacle(1100, size: 2.5),
    ]);
  }
}

abstract class FilipChallenge {
  static Challenge sockervadd() {
    return Challenge(
      name: 'Sockervadd',
      duration: 20,
      elements: [
        ChallengeElement.cash(Vector2(0, 0), amount: 2),
      ],
    );
  }
}
