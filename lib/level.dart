import 'dart:math';

import 'package:ffgame/barrel.dart';

class Level {
  final double speed;
  final List<Challenge> challenges;

  Level({
    this.challenges = const [],
    this.speed = 1,
  });

  static int totalLevels = 7;

  static List<Level> getAllLevels() {
    return List.generate(totalLevels + 1, (index) => Level.fromInt(index + 1));
  }

  static List<Challenge> getAllChallenges() {
    List<Challenge> challenges = [];
    for (var level in getAllLevels()) {
      challenges.addAll(level.challenges);
    }
    return challenges;
  }

  static Challenge? getChallengeFromId(String id) {
    final challenges = getAllChallenges();
    if (challenges.any((challenge) => challenge.id == id)) {
      return challenges.firstWhere((challenge) => challenge.id == id);
    }
    return null;
  }

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
          JhonChloo0.one(),
          JhonChloo0.two(),
        ]);
      case 2:
        return Level(challenges: [
          Filip2.crazyFrog(),
          Filip2.runAndJump(),
          JhonChloo1.one(),
          JhonChloo1.two(),
          JhonChloo1.three(),
          JhonChloo1.four(),
        ]);
      case 3:
        return Level(challenges: [
          JhonChloo2.one(),
          JhonChloo2.two(),
          JhonChloo2.three(),
          JhonChloo2.four(),
          Filip3.speedRun(),
          Filip3.birdChallenge(),
        ]);
      case 4:
        return Level(challenges: [
          Filip4.dodgeAndCollect(),
          Filip4.timeTrial(),
          JhonChloo4.one(),
        ]);
      case 5:
        return Level(challenges: [
          Filip5.ultimateChallenge(),
          Filip5.longJumpChallenge(),
          JhonChloo5.two(),
        ]);
      case 6:
        return Level(challenges: [
          Filip6.speedRunWithCars(),
          Filip6.mixedChallenge(),
          JhonChloo5.one(),
        ]);
      case 7:
        return Level(speed: 1.5, challenges: [
          Filip6.mixedChallenge(),
          JhonChloo5.one(),
        ]);
      default:
        return Level(speed: 2.5, challenges: [
          JhonChlooWip.one(),
          JhonChloo2.one(),
          JhonChloo2.two(),
          JhonChloo2.three(),
          JhonChloo2.four(),
          Filip3.speedRun(),
          Filip3.birdChallenge(),
          Filip6.speedRunWithCars(),
          Filip6.mixedChallenge(),
          JhonChloo5.one(),
        ]);
    }
  }
}
