import 'dart:math';
import 'dart:ui';
import 'package:ffgame/enums.dart';
import 'package:ffgame/player.dart';
import 'package:flame/game.dart';
import 'package:shared_preferences/shared_preferences.dart';

double radiansFromDegrees(double degrees) {
  return degrees * (pi / 180);
}

double degreesFromRadians(double radians) {
  return radians * (180 / pi);
}

double randomFromRange(double min, double max) {
  return (Random().nextDouble() * (max - min + 1)) + min;
}

int randomIntFromRange(int min, int max) {
  return (Random().nextDouble() * (max - min + 1)).round() + min;
}

// provide % chance to succeed
bool randomWithChance(double probability) {
  return Random().nextDouble() <= probability;
}

double get groundYPosition => Player().height / 2 + 30;

Future<double> getHighScore() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getDouble('high_score') ?? 0;
}

Future<double> setHighScore(double score) async {
  final prefs = await SharedPreferences.getInstance();
  final currentHighScore = prefs.getDouble('high_score') ?? 0;
  if (score > currentHighScore) {
    prefs.setDouble('high_score', score);
    return score;
  }
  return currentHighScore;
}

String scoreWithTitle(double score) {
  String title = LoyaltyLevels.fromScore(score).name;
  return '${score.round()} [$title]';
}

extension DoubleExtensions on double {
  double moveTowardsValue(double amount, double target) {
    if (this > target) {
      return max(target, this - amount);
    } else if (this < target) {
      return min(target, this + amount);
    }
    return this;
  }
}

extension OffsetExtension on Offset {
  /// Creates an [Vector2] from the [Offset]
  Vector2 toVector2() => Vector2(dx, dy);

  /// Creates a [Size] from the [Offset]
  Size toSize() => Size(dx, dy);

  /// Creates a [Point] from the [Offset]
  Point toPoint() => Point(dx, dy);

  /// Creates a [Rect] starting in origin and going the [Offset]
  Rect toRect() => Rect.fromLTWH(0, 0, dx, dy);
}

extension GamePositions on FlameGame {
  Vector2 get topRight => camera.visibleWorldRect.topRight.toVector2();
  Vector2 get topLeft => camera.visibleWorldRect.topLeft.toVector2();
  Vector2 get bottomRight => camera.visibleWorldRect.bottomRight.toVector2();
  Vector2 get bottomLeft => camera.visibleWorldRect.bottomLeft.toVector2();
  Vector2 get centerLeft => camera.visibleWorldRect.centerLeft.toVector2();
  Vector2 get centerRight => camera.visibleWorldRect.centerRight.toVector2();
}
