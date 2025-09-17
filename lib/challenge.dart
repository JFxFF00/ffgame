import 'package:ffgame/game.dart';
import 'package:ffgame/obstacle.dart';
import 'package:ffgame/coin.dart';
import 'package:flame/components.dart';

class Challenge {
  final List<ChallengeElement> elements;
  final double duration;
  final String? description;
  final String? name;

  Challenge({
    required this.elements,
    required this.duration,
    this.description = '',
    this.name = '',
  });

  /// Example: spawn all elements into the world at their positions
  void spawnInto(FFGame game) {
    for (final element in elements) {
      double xPosition = element.position.x;
      for (var i = 0; i < element.amount; i++) {
        final comp = element.createComponent();
        comp.size *= element.size;
        comp.position = Vector2(
          element.position.x + game.size.x + xPosition,
          element.position.y,
        );
        xPosition += comp.size.x;
        game.world.add(comp);
      }
    }
  }

  /// A cool sample challenge
  static Challenge coolChallenge() {
    return Challenge(
      name: "Cool Challenge",
      description: "Navigate through obstacles and collect coins",
      duration: 3,
      elements: [
        ChallengeElement.coin(Vector2(500, -60)),
        ChallengeElement.obstacleLump(700, 3),
        ChallengeElement.coin(Vector2(900, -100)),
        ChallengeElement.obstacle(1100),
        ChallengeElement.coin(Vector2(1300, -30)),
        ChallengeElement.obstacle(1500),
        ChallengeElement.coin(Vector2(1700, -10)),
        ChallengeElement.obstacle(1900),
      ],
    );
  }
}

class ChallengeElement {
  final Vector2 position;
  final ChallengeElementType type;
  final double size;
  final int amount;

  ChallengeElement(this.type, this.position, {this.size = 1, this.amount = 1});

  factory ChallengeElement.obstacleLump(
    double x,
    int amount, {
    double? size,
  }) {
    return ChallengeElement(
      ChallengeElementType.obstacle,
      Vector2(x, FFGame.groundYPosition),
      amount: amount,
      size: size ?? 1,
    );
  }

  factory ChallengeElement.obstacle(
    double x, {
    double? size,
  }) {
    return ChallengeElement(
      ChallengeElementType.obstacle,
      Vector2(x, FFGame.groundYPosition),
      size: size ?? 1,
    );
  }

  factory ChallengeElement.coin(Vector2 pos) {
    return ChallengeElement(
      ChallengeElementType.coin,
      Vector2(pos.x, FFGame.groundYPosition + pos.y),
    );
  }

  PositionComponent createComponent() {
    switch (type) {
      case ChallengeElementType.obstacle:
        return Obstacle();
      case ChallengeElementType.coin:
        return Coin();
    }
  }
}

enum ChallengeElementType { obstacle, coin }
