import 'package:ffgame/challenge.dart';
import 'package:flame/components.dart';

abstract class Filip {
  static Challenge crazyFrog() {
    return Challenge(duration: 5, elements: [
      ChallengeElement.coin(Vector2(0, -60)),
      ChallengeElement.coin(Vector2(10, -60)),
      ChallengeElement.coin(Vector2(20, -60)),
      ChallengeElement.coin(Vector2(30, -60)),
      ChallengeElement.coin(Vector2(40, -60)),
      ChallengeElement.coin(Vector2(50, -60)),
      ChallengeElement.coin(Vector2(60, -60)),
      ChallengeElement.obstacle(50, amount: 2, size: 0.443),
      ChallengeElement.coin(Vector2(100, -120)),
      ChallengeElement.obstacle(300, amount: 18, size: 0.3),
      ChallengeElement.obstacle(600, size: 3),
    ]);
  }

  static Challenge jumpOverCars() {
    return Challenge(duration: 3, elements: [
      ChallengeElement.obstacle(0, amount: 3, size: 0.7), // Three cars at start
      ChallengeElement.coin(Vector2(30, -60)), // Coin above first car
      ChallengeElement.coin(Vector2(90, -60)), // Coin above second car
      ChallengeElement.coin(Vector2(150, -60)), // Coin above third car
      ChallengeElement.obstacle(250, amount: 2, size: 1), // Two bigger cars
      ChallengeElement.coin(Vector2(280, -100)), // Coin above big car
      ChallengeElement.obstacle(400, size: 2), // Final big car
      ChallengeElement.coin(Vector2(420, -140)), // Coin
    ]);
  }

  static Challenge runAndJump() {
    return Challenge(duration: 3, elements: [
      ChallengeElement.coin(Vector2(0, -60)),
      ChallengeElement.coin(Vector2(20, -60)),
      ChallengeElement.coin(Vector2(40, -60)),
      ChallengeElement.obstacle(100, size: 1),
      ChallengeElement.coin(Vector2(120, -100)),
      ChallengeElement.coin(Vector2(140, -100)),
      ChallengeElement.obstacle(250, size: 1.5),
      ChallengeElement.coin(Vector2(270, -140)),
      ChallengeElement.coin(Vector2(290, -140)),
      ChallengeElement.obstacle(400, size: 2),
      ChallengeElement.coin(Vector2(420, -180)),
      ChallengeElement.coin(Vector2(440, -180)),
    ]);
  }

  static Challenge dodgeAndCollect() {
    return Challenge(duration: 3, elements: [
      ChallengeElement.coin(Vector2(0, -60)),
      ChallengeElement.obstacle(100, size: 1),
      ChallengeElement.coin(Vector2(120, -100)),
      ChallengeElement.obstacle(200, size: 1),
      ChallengeElement.coin(Vector2(220, -100)),
      ChallengeElement.obstacle(300, size: 1),
      ChallengeElement.coin(Vector2(320, -100)),
      ChallengeElement.obstacle(400, size: 1),
      ChallengeElement.coin(Vector2(420, -100)),
    ]);
  }

  static Challenge speedRun() {
    return Challenge(duration: 3, elements: [
      ChallengeElement.coin(Vector2(0, -60)),
      ChallengeElement.coin(Vector2(15, -60)),
      ChallengeElement.coin(Vector2(30, -60)),
      ChallengeElement.coin(Vector2(45, -60)),
      ChallengeElement.obstacle(100, size: 1),
      ChallengeElement.coin(Vector2(120, -100)),
      ChallengeElement.coin(Vector2(135, -100)),
      ChallengeElement.coin(Vector2(150, -100)),
      ChallengeElement.obstacle(250, size: 1.5),
      ChallengeElement.coin(Vector2(270, -140)),
      ChallengeElement.coin(Vector2(285, -140)),
      ChallengeElement.coin(Vector2(300, -140)),
      ChallengeElement.obstacle(400, size: 2),
      ChallengeElement.coin(Vector2(420, -180)),
      ChallengeElement.coin(Vector2(435, -180)),
      ChallengeElement.coin(Vector2(450, -180)),
    ]);
  }

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
      ChallengeElement.obstacle(250, amount: 2, size: 1), // Two cars
      ChallengeElement.coin(Vector2(270, -140)),
      ChallengeElement.coin(Vector2(285, -140)),
      ChallengeElement.coin(Vector2(300, -140)),
      ChallengeElement.obstacle(400, size: 2),
      ChallengeElement.coin(Vector2(420, -180)),
      ChallengeElement.coin(Vector2(435, -180)),
      ChallengeElement.coin(Vector2(450, -180)),
      ChallengeElement.obstacle(600, amount: 3, size: 1), // Three cars
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

  static Challenge coinCollector() {
    return Challenge(duration: 5, elements: [
      ChallengeElement.coin(Vector2(0, -60)),
      ChallengeElement.coin(Vector2(20, -60)),
      ChallengeElement.coin(Vector2(40, -60)),
      ChallengeElement.coin(Vector2(60, -60)),
      ChallengeElement.coin(Vector2(80, -60)),
      ChallengeElement.coin(Vector2(100, -60)),
      ChallengeElement.coin(Vector2(120, -60)),
      ChallengeElement.coin(Vector2(140, -60)),
      ChallengeElement.coin(Vector2(160, -60)),
      ChallengeElement.coin(Vector2(180, -60)),
      ChallengeElement.coin(Vector2(200, -60)),
      ChallengeElement.coin(Vector2(220, -60)),
      ChallengeElement.coin(Vector2(240, -60)),
      ChallengeElement.coin(Vector2(260, -60)),
      ChallengeElement.coin(Vector2(280, -60)),
      ChallengeElement.coin(Vector2(300, -60)),
      ChallengeElement.coin(Vector2(320, -60)),
      ChallengeElement.coin(Vector2(340, -60)),
      ChallengeElement.coin(Vector2(360, -60)),
      ChallengeElement.coin(Vector2(380, -60)),
      ChallengeElement.coin(Vector2(400, -60)),
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
