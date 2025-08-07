import 'dart:async';
import 'dart:convert';
import 'package:ffgame/barrel.dart';
import 'package:ffgame/score_overlay.dart';
import 'package:flame/components.dart';
import 'package:http/http.dart' as http;

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

  Future<void> getHighScores() async {
    final response = await http.get(
      Uri.parse('http://rpi.memention.net/doc/johans_highscore.json'),
    );

    final body = jsonDecode(response.body) as List<dynamic>;
    final highScores = body.map((e) => HighScoreEntry.fromJson(e)).toList();
    highScores.sort((a, b) => b.score.compareTo(a.score));

    this.highScores = highScores;
  }

  Future<void> addHighScore(HighScoreEntry entry) async {
    print('Adding high score: ${entry}');
    highScores.add(entry);
    highScores.sort((a, b) => b.score.compareTo(a.score));
    if (highScores.length > 10) {
      highScores.removeAt(10);
    }

    final body = jsonEncode(highScores.map((e) => e.toJson()).toList());
    print('Body: $body');

    await http.post(
      Uri.parse('http://rpi.memention.net/doc/johans_highscore.json'),
      body: body,
    );
    await getHighScores();
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
          text: 'Press space to restart',
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
