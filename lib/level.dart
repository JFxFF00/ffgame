import 'dart:math';

import 'package:ffgame/challenge.dart';
import 'package:ffgame/game.dart';

abstract class LevelHelper {
  static Level getLevel(int level, FFGame game) {
    switch (level) {
      case 1:
        return Level.coolLevel();
      default:
        return Level(
          name: "Level $level",
          length: 1000,
          challenges: [],
        );
    }
  }
}

class Level {
  final String name;
  final double length; // in game units
  final List<Challenge> challenges;

  Level({
    required this.name,
    required this.length,
    this.challenges = const [],
  });

  /// Add a challenge to this level
  void addChallenge(Challenge challenge) {
    challenges.add(challenge);
  }

  /// Remove a challenge from this level
  void removeChallenge(Challenge challenge) {
    challenges.remove(challenge);
  }

  /// Get all challenges in this level
  List<Challenge> getChallenges() {
    return List.unmodifiable(challenges);
  }

  /// Get a specific challenge by name
  Challenge? getChallengeByName(String name) {
    try {
      return challenges.firstWhere((challenge) => challenge.name == name);
    } catch (e) {
      return null;
    }
  }

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

  /// A cool sample level
  static Level coolLevel() {
    return Level(
      name: "Cool Level",
      length: 3000,
      challenges: [
        Challenge.coolChallenge(),
      ],
    );
  }
}
