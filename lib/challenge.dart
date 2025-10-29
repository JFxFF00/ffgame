import 'package:ffgame/barrel.dart';
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

  String get id => name?.toLowerCase().replaceAll(' ', '-') ?? '';

  /// Example: spawn all elements into the world at their positions
  void spawnInto(FFGame game) {
    for (final element in elements) {
      double xPosition = element.position.x;
      double startPosition = game.size.x + 120;
      for (var i = 0; i < element.amount; i++) {
        final component = element.createComponent();
        component.size *= element.size;
        component.position = Vector2(
          element.position.x + startPosition + xPosition,
          element.position.y,
        );
        xPosition += component.size.x;
        game.world.add(component);
      }
    }
  }
}

class ChallengeElement {
  final Vector2 position;
  final ChallengeElementType type;
  final double size;
  final int amount;

  ChallengeElement(this.type, this.position, {this.size = 1, this.amount = 1});

  factory ChallengeElement.obstacle(
    double x, {
    double? size,
    int? amount,
  }) {
    return ChallengeElement(
      ChallengeElementType.obstacle,
      Vector2(x, FFGame.groundYPosition),
      size: size ?? 1,
      amount: amount ?? 1,
    );
  }

  factory ChallengeElement.coin(Vector2 pos, {int? amount}) {
    return ChallengeElement(
      ChallengeElementType.coin,
      Vector2(pos.x, FFGame.groundYPosition + pos.y),
      amount: amount ?? 1,
    );
  }
  factory ChallengeElement.cash(Vector2 pos, {int? amount}) {
    return ChallengeElement(
      ChallengeElementType.cash,
      Vector2(pos.x, FFGame.groundYPosition + pos.y),
      amount: amount ?? 1,
    );
  }

  factory ChallengeElement.bird(Vector2 pos) {
    return ChallengeElement(
      ChallengeElementType.bird,
      Vector2(pos.x, FFGame.groundYPosition + pos.y),
    );
  }

  PositionComponent createComponent() {
    switch (type) {
      case ChallengeElementType.obstacle:
        return Obstacle();
      case ChallengeElementType.coin:
        return Coin();
      case ChallengeElementType.cash:
        return Cash();
      case ChallengeElementType.bird:
        return Bird();
    }
  }
}

enum ChallengeElementType { obstacle, coin, bird, cash }
