enum Direction {
  up,
  down,
  left,
  right,
}

extension DirectionHelper on Direction {
  bool get isUp => this == Direction.up;
  bool get isDown => this == Direction.down;
  bool get isLeft => this == Direction.left;
  bool get isRight => this == Direction.right;
}

enum LoyaltyLevels {
  come,
  stay,
  share,
  dream,
  takeOff,
  fly;

  String get name {
    switch (this) {
      case come:
        return 'Come';
      case stay:
        return 'Stay';
      case share:
        return 'Share';
      case dream:
        return 'Dream';
      case takeOff:
        return 'Take Off';
      case fly:
        return 'Fly';
    }
  }

  static LoyaltyLevels fromScore(score) {
    if (score > 1500) return fly;
    if (score > 1000) return takeOff;
    if (score > 500) return dream;
    if (score > 250) return share;
    if (score > 100) return stay;
    return come;
  }
}
