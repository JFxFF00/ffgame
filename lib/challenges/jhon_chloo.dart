import 'package:ffgame/challenge.dart';
import 'package:flame/components.dart';

abstract class JhonChlooWip {
  static Challenge one() {
    return Challenge(
      name: 'Speed Boost',
      duration: 14,
      elements: [
        ChallengeElement.starman(Vector2(0, 0)),
        ChallengeElement.speedBoost(200, amount: 2),
        ChallengeElement.obstacle(560, amount: 10),
        ChallengeElement.coin(Vector2(660, -280)),
        ChallengeElement.cash(Vector2(800, -360)),
        ChallengeElement.coin(Vector2(960, -320)),
        ChallengeElement.speedBoost(1600),
        ChallengeElement.coin(Vector2(1800, -10), amount: 3),
        ChallengeElement.obstacle(2200, amount: 3),
        ChallengeElement.speedBoost(2500),
        ChallengeElement.coin(Vector2(2540, -100)),
        ChallengeElement.obstacle(2640, amount: 3),
        ChallengeElement.speedBoost(3000),
        ChallengeElement.coin(Vector2(3040, -100)),
        ChallengeElement.obstacle(3200, amount: 3),
        ChallengeElement.speedBoost(3500),
        ChallengeElement.coin(Vector2(3540, -100)),
        ChallengeElement.obstacle(3640, amount: 3),
        ChallengeElement.speedBoost(4300, amount: 3),
        ChallengeElement.obstacle(4840, amount: 11),
        ChallengeElement.coin(Vector2(5060, -320), amount: 10),
        ChallengeElement.speedBoost(6200, amount: 8),
        ChallengeElement.obstacle(7400, amount: 18),
        ChallengeElement.coin(Vector2(7600, -280), amount: 5),
        ChallengeElement.coin(Vector2(7800, -310), amount: 5),
        ChallengeElement.coin(Vector2(8000, -280), amount: 5),
      ],
    );
  }
}

abstract class JhonChloo0 {
  static Challenge one() {
    return Challenge(
      name: 'Boins',
      duration: 4,
      elements: [
        ChallengeElement.coin(Vector2(0, -200), amount: 2),
        ChallengeElement.coin(Vector2(600, -350), amount: 2),
        ChallengeElement.coin(Vector2(1200, -130), amount: 2),
      ],
    );
  }

  static Challenge two() {
    return Challenge(
      duration: 5.2,
      name: 'Simple',
      elements: [
        ChallengeElement.obstacle(0),
        ChallengeElement.coin(Vector2(0, -350)),
        ChallengeElement.obstacle(800),
        ChallengeElement.coin(Vector2(760, -250)),
        ChallengeElement.coin(Vector2(840, -250)),
        ChallengeElement.obstacle(1600),
        ChallengeElement.coin(Vector2(1600, -350)),
      ],
    );
  }
}

abstract class JhonChloo1 {
  static Challenge death() {
    return Challenge(
      name: 'Death',
      duration: 4,
      elements: [
        ChallengeElement.obstacle(200, size: 15),
      ],
    );
  }

  static Challenge one() {
    return Challenge(
      name: 'Insect',
      duration: 5.5,
      elements: [
        ChallengeElement.coin(Vector2(200, -100)),
        ChallengeElement.obstacle(340),
        ChallengeElement.obstacle(400, size: 1.5),
        ChallengeElement.obstacle(500),
        ChallengeElement.coin(Vector2(620, 0)),
        ChallengeElement.obstacle(900, amount: 3),
        ChallengeElement.coin(Vector2(1200, -120)),
        ChallengeElement.obstacle(1600),
        ChallengeElement.obstacle(2000),
        ChallengeElement.obstacle(2400),
      ],
    );
  }

  static Challenge two() {
    return Challenge(
      name: 'Cicada',
      duration: 6,
      elements: [
        ChallengeElement.obstacle(200),
        ChallengeElement.coin(Vector2(500, -90)),
        ChallengeElement.obstacle(800, amount: 2),
        ChallengeElement.obstacle(1300, size: 2.4),
        ChallengeElement.coin(Vector2(1380, -300)),
        ChallengeElement.obstacle(1800, amount: 2),
        ChallengeElement.obstacle(2400, amount: 3, size: 0.9),
      ],
    );
  }

  static Challenge three() {
    return Challenge(
      name: 'Ocelot',
      duration: 4,
      elements: [
        ChallengeElement.obstacle(200, size: 1.5),
        ChallengeElement.coin(Vector2(500, -90)),
        ChallengeElement.obstacle(900, size: 1.5),
        ChallengeElement.obstacle(1400, amount: 4, size: 0.9),
      ],
    );
  }

  static Challenge four() {
    return Challenge(
      name: 'Filth',
      duration: 4,
      elements: [
        ChallengeElement.obstacle(0, size: 1.5),
        ChallengeElement.obstacle(460, amount: 4),
        ChallengeElement.coin(Vector2(480, -200)),
        ChallengeElement.coin(Vector2(560, -230)),
        ChallengeElement.coin(Vector2(640, -200)),
        ChallengeElement.obstacle(1160, amount: 2, size: 1.3),
        ChallengeElement.coin(Vector2(1180, -325), amount: 2),
      ],
    );
  }
}

abstract class JhonChloo2 {
  static Challenge one() {
    return Challenge(
      duration: 4,
      name: 'Bird Land',
      elements: [
        ChallengeElement.bird(Vector2(200, -100)),
        ChallengeElement.obstacle(400, amount: 4),
        ChallengeElement.bird(Vector2(1500, -50)),
        ChallengeElement.coin(Vector2(1000, -200)),
        ChallengeElement.bird(Vector2(1500, -450)),
      ],
    );
  }

  static Challenge two() {
    return Challenge(
      duration: 4,
      name: 'Solo Bird',
      elements: [
        ChallengeElement.obstacle(0, size: 2),
        ChallengeElement.coin(Vector2(200, 0), amount: 3),
        ChallengeElement.obstacle(560),
        ChallengeElement.obstacle(660, size: 2),
        ChallengeElement.obstacle(760, amount: 2),
        ChallengeElement.coin(Vector2(980, -10)),
        ChallengeElement.bird(Vector2(1800, -150)),
        ChallengeElement.coin(Vector2(1400, -300)),
      ],
    );
  }

  static Challenge three() {
    return Challenge(
      duration: 4,
      name: 'Short Solo Bird',
      elements: [
        ChallengeElement.obstacle(0, amount: 5, size: 0.8),
        ChallengeElement.obstacle(560, amount: 2, size: 1.5),
        ChallengeElement.coin(Vector2(660, -250)),
        ChallengeElement.obstacle(1200, amount: 2),
        ChallengeElement.coin(Vector2(1260, -150)),
        ChallengeElement.bird(Vector2(1700, -350)),
      ],
    );
  }

  static Challenge four() {
    return Challenge(
      duration: 3.5,
      name: 'Tiny Bing Bong Challenge',
      elements: [
        ChallengeElement.obstacle(0, size: 3),
        ChallengeElement.obstacle(400, amount: 3),
        ChallengeElement.obstacle(880, size: 3),
        ChallengeElement.coin(Vector2(0, -300)),
        ChallengeElement.coin(Vector2(880, -300)),
      ],
    );
  }
}

abstract class JhonChloo4 {
  static Challenge one() {
    return Challenge(
      name: 'Bing Bong Bang With Bird',
      duration: 4.5,
      elements: [
        ChallengeElement.obstacle(0, size: 2.5, amount: 2),
        ChallengeElement.obstacle(560, amount: 2),
        ChallengeElement.obstacle(700, amount: 2, size: 1.5),
        ChallengeElement.obstacle(880, amount: 2),
        ChallengeElement.obstacle(1240, size: 1.7),
        ChallengeElement.obstacle(1320, size: 2.2),
        ChallengeElement.obstacle(1420, size: 2.7),
        ChallengeElement.cash(Vector2(1560, 0)),
        ChallengeElement.coin(Vector2(0, -300)),
        ChallengeElement.coin(Vector2(80, -320)),
        ChallengeElement.coin(Vector2(160, -300)),
        ChallengeElement.coin(Vector2(600, -280), amount: 2),
        ChallengeElement.bird(Vector2(700, -310)),
        ChallengeElement.coin(Vector2(700, -310), amount: 2),
        ChallengeElement.coin(Vector2(800, -280), amount: 2),
      ],
    );
  }
}

abstract class JhonChloo5 {
  static Challenge one() {
    return Challenge(
      name: 'Difficult Bird',
      duration: 4,
      elements: [
        ChallengeElement.coin(Vector2(160, -180)),
        ChallengeElement.obstacle(100, amount: 3),
        ChallengeElement.bird(Vector2(200, -350)),
        ChallengeElement.bird(Vector2(400, -350)),
        ChallengeElement.obstacle(800, size: 2),
        ChallengeElement.coin(Vector2(700, -180)),
        ChallengeElement.coin(Vector2(800, -220)),
        ChallengeElement.coin(Vector2(900, -180)),
        ChallengeElement.bird(Vector2(1100, -350)),
        ChallengeElement.bird(Vector2(1300, -350)),
      ],
    );
  }

  static Challenge two() {
    return Challenge(
      name: 'lemme see',
      duration: 4.5,
      elements: [
        ChallengeElement.obstacle(0, size: 2),
        ChallengeElement.obstacle(300, amount: 2, size: 1.5),
        ChallengeElement.coin(Vector2(120, -200)),
        ChallengeElement.obstacle(800, size: 2.5),
        ChallengeElement.coin(Vector2(680, -250)),
        ChallengeElement.coin(Vector2(840, -300)),
        ChallengeElement.bird(Vector2(940, -350)),
        ChallengeElement.obstacle(1200, size: 1.8),
        ChallengeElement.coin(Vector2(1300, -180)),
        ChallengeElement.obstacle(1440, size: 1.2),
        ChallengeElement.cash(Vector2(1540, 0)),
        ChallengeElement.obstacle(1642, size: 1.2),
      ],
    );
  }
}
