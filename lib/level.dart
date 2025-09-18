import 'dart:math';

import 'package:ffgame/barrel.dart';

class Level {
  final String name;
  final List<Challenge> challenges;

  Level({
    this.name = '',
    this.challenges = const [],
  });

  /// Spawn all challenges into the world
  Challenge spawnChallengesInto(FFGame game) {
    if (challenges.isNotEmpty) {
      final random = Random();
      final randomIndex =
          (challenges.length == 1) ? 0 : random.nextInt(challenges.length);
      challenges[randomIndex].spawnInto(game);
      return challenges[randomIndex];
    }
    throw Exception('No challenges found');
  }

  factory Level.fromInt(int level) {
    switch (level) {
      case 1:
        return Level(challenges: [
          Filip1.coinCollector(),
          Filip1.jumpOverCars(),
          JhonChloo.one(),
          JhonChloo.two(),
          JhonChloo.three(),
        ]);
      case 2:
        return Level(challenges: [
          Filip2.crazyFrog(),
        ]);
      case 3:
        return Level(challenges: [
          JhonChloo2.one(),
          JhonChloo2.two(),
          JhonChloo2.three(),
        ]);
      case 4:
        return Level(challenges: [
          JhonChloo4.one(),
        ]);
      default:
        return Level(challenges: [
          Filip1.jumpOverCars(),
        ]);
    }
  }
}
