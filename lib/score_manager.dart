import 'dart:async';
import 'package:ffgame/barrel.dart';
import 'package:flame/components.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ScoreManager {
  List<HighScoreEntry> highScores = [];
  double scoreFromCoins = 0;
  double scoreFromDistance = 0;
  bool canSubmit = true;

  HighScoreEntry get highScore =>
      highScores.firstOrNull ?? HighScoreEntry(name: 'No one', score: 0);

  double get score => scoreFromCoins + scoreFromDistance;

  void addScore(double score, {bool fromCoin = false}) {
    if (fromCoin) {
      scoreFromCoins += score;
    } else {
      scoreFromDistance += score;
    }
  }

  Future<void> newGame() async {
    scoreFromCoins = 0;
    scoreFromDistance = 0;
  }

  Future<void> getHighScores(FFGame game) async {
    final challenge = game.challenge;
    String docName = 'mainHighscore';
    if (challenge != null) {
      docName = 'challenge-${challenge.id}';
    }
    final doc = await FirebaseFirestore.instance
        .collection('frilansFlame')
        .doc(docName)
        .get();

    if (!doc.exists || doc.data() == null) {
      highScores = [];
      return;
    }

    final scoresData = doc.data()!['scores'] as List<dynamic>?;
    if (scoresData == null) {
      highScores = [];
      return;
    }

    final parsedScores = scoresData
        .map((e) => HighScoreEntry.fromJson(e as Map<String, dynamic>))
        .toList();
    parsedScores.sort((a, b) => b.score.compareTo(a.score));

    highScores = parsedScores;
  }

  Future<void> addHighScore(HighScoreEntry newEntry, FFGame game) async {
    final challenge = game.challenge;
    String docName = 'mainHighscore';
    if (challenge != null) {
      docName = 'challenge-${challenge.id}';
    }
    highScores.add(newEntry);
    // Keep only the highest score for each name
    final Map<String, HighScoreEntry> updatedEntries = {};
    for (var entry in highScores) {
      final entryExists = updatedEntries.containsKey(entry.name);
      bool newScoreIsHigher = true;
      if (entryExists) {
        newScoreIsHigher = entry.score > updatedEntries[entry.name]!.score;
      }
      if (newScoreIsHigher) {
        updatedEntries[entry.name] = entry;
      }
    }
    highScores
      ..clear()
      ..addAll(updatedEntries.values);
    highScores.sort((a, b) => b.score.compareTo(a.score));
    if (highScores.length > 10) {
      highScores.removeAt(10);
    }

    final scoresList = highScores.map((e) => e.toJson()).toList();

    await FirebaseFirestore.instance
        .collection('frilansFlame')
        .doc(docName)
        .set({'scores': scoresList}, SetOptions(merge: true));

    await getHighScores(game);
  }

  void showScores(FFGame game) {
    game.overlays.add(ScoreOverlay.name);
  }

  void hideScores(FFGame game) {
    game.overlays.remove(ScoreOverlay.name);
  }
}

class HighScoreEntry {
  final String name;
  final double score;

  HighScoreEntry({required this.name, required this.score});

  Map<String, dynamic> toJson() => {'name': name, 'score': score};

  factory HighScoreEntry.fromJson(Map<String, dynamic> json) =>
      HighScoreEntry(name: json['name'], score: json['score']);

  @override
  String toString() {
    return '\n$name: ${scoreWithTitle(score)}';
  }
}

class TitleText extends TextComponent with HasGameReference<FFGame> {
  TitleText()
      : super(
          text: 'Press "R" to restart',
          size: Vector2(100, 100),
        );

  @override
  void onLoad() {
    super.onLoad();
    anchor = Anchor.center;
  }

  @override
  void update(double dt) {
    final curve = sinCurve(
      game.currentTime(),
      amplitude: 0.1,
      frequency: 6,
      minimum: 14,
    );
    scale.x = curve;
    scale.y = curve;
    super.update(dt);
  }
}
