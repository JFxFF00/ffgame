import 'dart:convert';

import 'package:http/http.dart' as http;

class HighScoreEntry {
  final String name;
  final double score;

  HighScoreEntry({required this.name, required this.score});

  Map<String, dynamic> toJson() => {'name': name, 'score': score};

  factory HighScoreEntry.fromJson(Map<String, dynamic> json) =>
      HighScoreEntry(name: json['name'], score: json['score']);
}

class HighScoreManager {
  final List<HighScoreEntry> highScores = [];

  Future<void> addHighScore(HighScoreEntry entry) async {
    highScores.add(entry);
    highScores.sort((a, b) => b.score.compareTo(a.score));
    if (highScores.length > 10) {
      highScores.removeAt(10);
    }

    final body = jsonEncode(highScores.map((e) => e.toJson()).toList());

    http.post(
      Uri.parse('http://rpi.memention.net/doc/johans_highscore.json'),
      body: body,
    );
  }

  Future<List<HighScoreEntry>> getHighScores() async {
    final response = await http
        .get(Uri.parse('http://rpi.memention.net/doc/johans_highscore.json'));

    final body = jsonDecode(response.body) as List<dynamic>;
    return body.map((e) => HighScoreEntry.fromJson(e)).toList();
  }
}
