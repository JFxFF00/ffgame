import 'dart:math';

import 'package:ffgame/challenge.dart';
import 'package:ffgame/challenges/jhon_chloo.dart';
import 'package:ffgame/game.dart';

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
          (challenges.length == 1) ? 0 : random.nextInt(challenges.length - 1);
      challenges[randomIndex].spawnInto(game);
      return challenges[randomIndex];
    }
    throw Exception('No challenges found');
  }

  factory Level.fromInt(int level) {
    switch (level) {
      case 1:
        return Level(challenges: [JhonChloo.cool()]);
      default:
        return Level(challenges: []);
    }
  }
}
