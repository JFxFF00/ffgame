import 'package:ffgame/challenge.dart';
import 'package:flame/components.dart';

abstract class JhonChlooWip {
  static Challenge one() {
    return Challenge(
      name: 'Speed Boost',
      duration: 14,
      elements: [
        ChallengeElement.starman(Vector2(0, 0)),
        ChallengeElement.speedBoost(100, amount: 2),
        ChallengeElement.obstacle(280, amount: 10),
        ChallengeElement.coin(Vector2(330, -280)),
        ChallengeElement.cash(Vector2(400, -360)),
        ChallengeElement.coin(Vector2(480, -320)),
        ChallengeElement.speedBoost(800),
        ChallengeElement.coin(Vector2(900, -10), amount: 3),
        ChallengeElement.obstacle(1100, amount: 3),
        ChallengeElement.speedBoost(1250),
        ChallengeElement.coin(Vector2(1270, -100)),
        ChallengeElement.obstacle(1320, amount: 3),
        ChallengeElement.speedBoost(1500),
        ChallengeElement.coin(Vector2(1520, -100)),
        ChallengeElement.obstacle(1600, amount: 3),
        ChallengeElement.speedBoost(1750),
        ChallengeElement.coin(Vector2(1770, -100)),
        ChallengeElement.obstacle(1820, amount: 3),
        ChallengeElement.speedBoost(2150, amount: 3),
        ChallengeElement.obstacle(2420, amount: 11),
        ChallengeElement.coin(Vector2(2530, -320), amount: 10),
        ChallengeElement.speedBoost(3100, amount: 8),
        ChallengeElement.obstacle(3700, amount: 18),
        ChallengeElement.coin(Vector2(3800, -280), amount: 5),
        ChallengeElement.coin(Vector2(3900, -310), amount: 5),
        ChallengeElement.coin(Vector2(4000, -280), amount: 5),
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
        ChallengeElement.coin(Vector2(300, -350), amount: 2),
        ChallengeElement.coin(Vector2(600, -130), amount: 2),
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
        ChallengeElement.obstacle(400),
        ChallengeElement.coin(Vector2(380, -250)),
        ChallengeElement.coin(Vector2(420, -250)),
        ChallengeElement.obstacle(800),
        ChallengeElement.coin(Vector2(800, -350)),
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
        ChallengeElement.obstacle(100, size: 15),
      ],
    );
  }

  static Challenge one() {
    return Challenge(
      name: 'Insect',
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
      name: 'Cicada',
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
      name: 'Ocelot',
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
      name: 'Filth',
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
      name: 'Bird Land',
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
      name: 'Solo Bird',
      elements: [
        ChallengeElement.obstacle(0, size: 2),
        ChallengeElement.coin(Vector2(100, 0), amount: 3),
        ChallengeElement.obstacle(280),
        ChallengeElement.obstacle(330, size: 2),
        ChallengeElement.obstacle(380, amount: 2),
        ChallengeElement.coin(Vector2(490, -10)),
        ChallengeElement.bird(Vector2(900, -150)),
        ChallengeElement.coin(Vector2(700, -300)),
      ],
    );
  }

  static Challenge three() {
    return Challenge(
      duration: 4,
      name: 'Short Solo Bird',
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

  static Challenge four() {
    return Challenge(
      duration: 3.5,
      name: 'Tiny Bing Bong Challenge',
      elements: [
        ChallengeElement.obstacle(0, size: 3),
        ChallengeElement.obstacle(200, amount: 3),
        ChallengeElement.obstacle(440, size: 3),
        ChallengeElement.coin(Vector2(0, -300)),
        ChallengeElement.coin(Vector2(440, -300)),
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
        ChallengeElement.obstacle(280, amount: 2),
        ChallengeElement.obstacle(350, amount: 2, size: 1.5),
        ChallengeElement.obstacle(440, amount: 2),
        ChallengeElement.obstacle(620, size: 1.7),
        ChallengeElement.obstacle(660, size: 2.2),
        ChallengeElement.obstacle(710, size: 2.7),
        ChallengeElement.cash(Vector2(780, 0)),
        ChallengeElement.coin(Vector2(0, -300)),
        ChallengeElement.coin(Vector2(40, -320)),
        ChallengeElement.coin(Vector2(80, -300)),
        ChallengeElement.coin(Vector2(300, -280), amount: 2),
        ChallengeElement.bird(Vector2(350, -310)),
        ChallengeElement.coin(Vector2(350, -310), amount: 2),
        ChallengeElement.coin(Vector2(400, -280), amount: 2),
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
        ChallengeElement.coin(Vector2(80, -180)),
        ChallengeElement.obstacle(50, amount: 3),
        ChallengeElement.bird(Vector2(100, -350)),
        ChallengeElement.bird(Vector2(200, -350)),
        ChallengeElement.obstacle(400, size: 2),
        ChallengeElement.coin(Vector2(350, -180)),
        ChallengeElement.coin(Vector2(400, -220)),
        ChallengeElement.coin(Vector2(450, -180)),
        ChallengeElement.bird(Vector2(550, -350)),
        ChallengeElement.bird(Vector2(650, -350)),
      ],
    );
  }

  static Challenge two() {
    return Challenge(
      name: 'lemme see',
      duration: 4.5,
      elements: [
        ChallengeElement.obstacle(0, size: 2),
        ChallengeElement.obstacle(150, amount: 2, size: 1.5),
        ChallengeElement.coin(Vector2(60, -200)),
        ChallengeElement.obstacle(400, size: 2.5),
        ChallengeElement.coin(Vector2(340, -250)),
        ChallengeElement.coin(Vector2(420, -300)),
        ChallengeElement.bird(Vector2(470, -350)),
        ChallengeElement.obstacle(600, size: 1.8),
        ChallengeElement.coin(Vector2(650, -180)),
        ChallengeElement.obstacle(720, size: 1.2),
        ChallengeElement.cash(Vector2(770, 0)),
        ChallengeElement.obstacle(821, size: 1.2),
      ],
    );
  }
}
