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
      double startPosition = game.size.x + 120;
      for (var i = 0; i < element.amount; i++) {
        for (var j = 0; j < element.verticalAmount; j++) {
          final component = element.createComponent();
          component.size *= element.size;
          component.position = Vector2(
            element.position.x +
                startPosition +
                i * component.size.x +
                i * element.gap,
            element.position.y - j * component.size.y - j * element.verticalGap,
          );
          game.world.add(component);
        }
      }
    }
  }
}

class ChallengeElement {
  final Vector2 position;
  final ChallengeElementType type;
  final double size;
  final int amount;
  final int verticalAmount;
  final double gap;
  final double verticalGap;

  ChallengeElement(
    this.type,
    this.position, {
    this.size = 1,
    this.amount = 1,
    this.verticalAmount = 1,
    this.gap = 0,
    this.verticalGap = 0,
  });

  factory ChallengeElement.obstacle(
    double x, {
    double? y,
    double? size,
    int? amount,
    int? verticalAmount,
    double? gap,
    double? verticalGap,
  }) {
    return ChallengeElement(
      ChallengeElementType.obstacle,
      Vector2(x, FFGame.groundYPosition - (y ?? 0)),
      size: size ?? 1,
      amount: amount ?? 1,
      verticalAmount: verticalAmount ?? 1,
      gap: gap ?? 0,
      verticalGap: verticalGap ?? 0,
    );
  }

  factory ChallengeElement.coin(
    Vector2 pos, {
    int? amount,
    int? verticalAmount,
    double? gap,
    double? verticalGap,
  }) {
    return ChallengeElement(
      ChallengeElementType.coin,
      Vector2(pos.x, FFGame.groundYPosition + pos.y),
      amount: amount ?? 1,
      verticalAmount: verticalAmount ?? 1,
      gap: gap ?? 0,
      verticalGap: verticalGap ?? 0,
    );
  }
  factory ChallengeElement.cash(
    Vector2 pos, {
    int? amount,
    int? verticalAmount,
    double? gap,
    double? verticalGap,
  }) {
    return ChallengeElement(
      ChallengeElementType.cash,
      Vector2(pos.x, FFGame.groundYPosition + pos.y),
      amount: amount ?? 1,
      verticalAmount: verticalAmount ?? 1,
      gap: gap ?? 0,
      verticalGap: verticalGap ?? 0,
    );
  }

  factory ChallengeElement.bird(
    Vector2 pos, {
    int? amount,
    int? verticalAmount,
    double? gap,
    double? verticalGap,
  }) {
    return ChallengeElement(
      ChallengeElementType.bird,
      Vector2(pos.x, FFGame.groundYPosition + pos.y),
      amount: amount ?? 1,
      verticalAmount: verticalAmount ?? 1,
      gap: gap ?? 0,
      verticalGap: verticalGap ?? 0,
    );
  }

  factory ChallengeElement.speedBoost(
    double x, {
    int? amount,
    int? verticalAmount,
    double? gap,
    double? verticalGap,
  }) {
    return ChallengeElement(
      ChallengeElementType.speedBoost,
      Vector2(x, FFGame.groundYPosition),
      amount: amount ?? 1,
      verticalAmount: verticalAmount ?? 1,
      gap: gap ?? 0,
      verticalGap: verticalGap ?? 0,
    );
  }

  factory ChallengeElement.starman(
    Vector2 pos,
  ) {
    return ChallengeElement(
      ChallengeElementType.starman,
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
      case ChallengeElementType.speedBoost:
        return SpeedTrack();
      case ChallengeElementType.starman:
        return Starman();
    }
  }
}

enum ChallengeElementType { obstacle, coin, bird, cash, speedBoost, starman }
