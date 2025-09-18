import 'package:ffgame/challenge.dart';
import 'package:flame/components.dart';

abstract class Filip {
  static Challenge ultimateChallenge() {
    return Challenge(duration: 5, elements: [
      ChallengeElement.coin(Vector2(0, -60)),
      ChallengeElement.coin(Vector2(20, -60)),
      ChallengeElement.obstacle(100, size: 1),
      ChallengeElement.coin(Vector2(120, -100)),
      ChallengeElement.obstacle(200, size: 1),
      ChallengeElement.coin(Vector2(220, -100)),
      ChallengeElement.obstacle(300, size: 1),
      ChallengeElement.coin(Vector2(320, -100)),
      ChallengeElement.obstacle(400, size: 1),
      ChallengeElement.coin(Vector2(420, -100)),
      ChallengeElement.obstacle(550, amount: 2, size: 1.5),
      ChallengeElement.coin(Vector2(570, -140)),
      ChallengeElement.obstacle(700, size: 2),
      ChallengeElement.coin(Vector2(720, -180)),
      ChallengeElement.obstacle(850, amount: 3, size: 1),
      ChallengeElement.coin(Vector2(870, -140)),
      ChallengeElement.obstacle(1000, size: 2.5),
      ChallengeElement.coin(Vector2(1020, -220)),
    ]);
  }

  static Challenge speedRunWithCars() {
    return Challenge(duration: 5, elements: [
      ChallengeElement.coin(Vector2(0, -60)),
      ChallengeElement.coin(Vector2(15, -60)),
      ChallengeElement.coin(Vector2(30, -60)),
      ChallengeElement.coin(Vector2(45, -60)),
      ChallengeElement.obstacle(100, size: 1),
      ChallengeElement.coin(Vector2(120, -100)),
      ChallengeElement.coin(Vector2(135, -100)),
      ChallengeElement.coin(Vector2(150, -100)),
      ChallengeElement.obstacle(250, amount: 2, size: 1),
      ChallengeElement.coin(Vector2(270, -140)),
      ChallengeElement.coin(Vector2(285, -140)),
      ChallengeElement.coin(Vector2(300, -140)),
      ChallengeElement.obstacle(400, size: 2),
      ChallengeElement.coin(Vector2(420, -180)),
      ChallengeElement.coin(Vector2(435, -180)),
      ChallengeElement.coin(Vector2(450, -180)),
      ChallengeElement.obstacle(600, amount: 3, size: 1),
      ChallengeElement.coin(Vector2(620, -140)),
      ChallengeElement.coin(Vector2(635, -140)),
      ChallengeElement.coin(Vector2(650, -140)),
      ChallengeElement.obstacle(800, size: 2.5),
      ChallengeElement.coin(Vector2(820, -220)),
      ChallengeElement.coin(Vector2(835, -220)),
      ChallengeElement.coin(Vector2(850, -220)),
    ]);
  }

  static Challenge longJumpChallenge() {
    return Challenge(duration: 5, elements: [
      ChallengeElement.coin(Vector2(0, -60)),
      ChallengeElement.coin(Vector2(20, -60)),
      ChallengeElement.obstacle(100, size: 1),
      ChallengeElement.coin(Vector2(120, -100)),
      ChallengeElement.obstacle(250, size: 1.5),
      ChallengeElement.coin(Vector2(270, -140)),
      ChallengeElement.obstacle(450, size: 2),
      ChallengeElement.coin(Vector2(470, -180)),
      ChallengeElement.obstacle(700, size: 2.5),
      ChallengeElement.coin(Vector2(720, -220)),
      ChallengeElement.obstacle(1000, size: 3),
      ChallengeElement.coin(Vector2(1020, -260)),
    ]);
  }

  static Challenge mixedChallenge() {
    return Challenge(duration: 5, elements: [
      ChallengeElement.coin(Vector2(0, -60)),
      ChallengeElement.coin(Vector2(20, -60)),
      ChallengeElement.obstacle(100, size: 1),
      ChallengeElement.coin(Vector2(120, -100)),
      ChallengeElement.obstacle(200, size: 1),
      ChallengeElement.coin(Vector2(220, -100)),
      ChallengeElement.obstacle(300, size: 1),
      ChallengeElement.coin(Vector2(320, -100)),
      ChallengeElement.obstacle(400, size: 1),
      ChallengeElement.coin(Vector2(420, -100)),
      ChallengeElement.obstacle(550, amount: 2, size: 1.5),
      ChallengeElement.coin(Vector2(570, -140)),
      ChallengeElement.obstacle(700, size: 2),
      ChallengeElement.coin(Vector2(720, -180)),
      ChallengeElement.obstacle(850, amount: 3, size: 1),
      ChallengeElement.coin(Vector2(870, -140)),
      ChallengeElement.obstacle(1000, size: 2.5),
      ChallengeElement.coin(Vector2(1020, -220)),
    ]);
  }
}

abstract class Filip1 {
  static Challenge coinCollector() {
    return Challenge(name: 'Coin Collector', duration: 5, elements: [
      ChallengeElement.coin(Vector2(0, 0), amount: 20),
    ]);
  }

  static Challenge jumpOverCars() {
    return Challenge(name: 'Jump Over Cars', duration: 5, elements: [
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
      ChallengeElement.obstacle(600, size: 3),
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
    return Challenge(duration: 5, elements: [
      ChallengeElement.bird(Vector2(0, -200)),
      ChallengeElement.obstacle(0, size: 1),
      ChallengeElement.coin(Vector2(120, 0)),
      ChallengeElement.obstacle(200, size: 2),
      ChallengeElement.coin(Vector2(350, 0)),
      ChallengeElement.obstacle(400, size: 1.5),
    ]);
  }
}

abstract class Filip4 {
  static Challenge dodgeAndCollect() {
    return Challenge(duration: 5, elements: [
      ChallengeElement.obstacle(0),
      ChallengeElement.obstacle(200),
      ChallengeElement.bird(Vector2(200, -100)),
      ChallengeElement.cash(Vector2(320, 0)),
      ChallengeElement.obstacle(400),
      ChallengeElement.obstacle(600),
      ChallengeElement.bird(Vector2(600, -100)),
    ]);
  }
}
