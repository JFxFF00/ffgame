import 'package:flutter/material.dart';

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

  Color get color {
    switch (this) {
      case come:
        return Colors.red;
      case LoyaltyLevels.stay:
      case LoyaltyLevels.share:
      case LoyaltyLevels.dream:
      case LoyaltyLevels.takeOff:
      case LoyaltyLevels.fly:
        return Colors.blue;
    }
  }

  double get threshold {
    switch (this) {
      case come:
        return 0;
      case stay:
        return 100;
      case share:
        return 250;
      case dream:
        return 500;
      case takeOff:
        return 1000;
      case fly:
        return 1500;
    }
  }

  static LoyaltyLevels fromScore(score) {
    if (score > fly.threshold) return fly;
    if (score > takeOff.threshold) return takeOff;
    if (score > dream.threshold) return dream;
    if (score > share.threshold) return share;
    if (score > stay.threshold) return stay;
    return come;
  }
}

enum GameState {
  playing,
  scoreScreen,
}
