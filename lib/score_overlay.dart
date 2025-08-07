import 'package:ffgame/barrel.dart';
import 'package:ffgame/high_score.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScoreOverlay extends StatefulWidget {
  final FFGame game;
  const ScoreOverlay({super.key, required this.game});

  static const name = 'Score summary';

  @override
  State<ScoreOverlay> createState() => _ScoreOverlayState();
}

class _ScoreOverlayState extends State<ScoreOverlay> {
  String name = '';
  TextEditingController nameController = TextEditingController();

  @override
  void initState() {
    SharedPreferences.getInstance().then((preferences) {
      name = preferences.getString('name') ?? '';
      nameController.text = name;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.black.withAlpha(60),
          child: Row(
            children: [
              Expanded(child: SizedBox()),
              Expanded(child: _runScore(widget.game)),
              Expanded(child: _highScores(widget.game)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _highScores(FFGame game) {
    final TextStyle style = TextStyle(
      fontSize: 20,
      color: Colors.white,
    );
    final highScores = game.scoreManager.highScores;

    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        width: 240,
        margin: EdgeInsets.all(40),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.black.withAlpha(180),
        ),
        child: Column(
          spacing: 4,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('High Scores',
                style: style.copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                )),
            Divider(color: Colors.white),
            for (int index = 0; index < highScores.length; index++)
              _score(highScores[index], index),
          ],
        ),
      ),
    );
  }

  Widget _score(HighScoreEntry entry, int index) {
    TextStyle style = TextStyle(
      fontSize: 20,
      color: Colors.white,
    );
    final placement = index + 1;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('${placement}. ${entry.name}', style: style),
        Text('${entry.score.round()}', style: style),
      ],
    );
  }

  Widget _runScore(FFGame game) {
    TextStyle style = TextStyle(
      fontSize: 20,
      color: Colors.white,
    );
    final scoreManager = game.scoreManager;
    final LoyaltyLevels loyaltyLevel =
        LoyaltyLevels.fromScore(scoreManager.score);

    return Container(
      width: 240,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.black.withAlpha(180),
      ),
      child: Column(
        spacing: 12,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Game over',
            style: style.copyWith(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Coins',
                style: style,
              ),
              Text(
                '${scoreManager.scoreFromCoins.round()}',
                style: style,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Distance',
                style: style,
              ),
              Text(
                '${scoreManager.scoreFromDistance.round()}',
                style: style,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total',
                style: style.copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                '${scoreManager.score.round()}',
                style: style.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Your rating!',
                style: style,
              ),
              Text(
                '[${(loyaltyLevel.name)}]',
                style: style.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          _loyaltyLevelProgress(),
          SizedBox(height: 20),
          if (game.scoreManager.canSubmit)
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: nameController,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      fillColor: Colors.white,
                    ),
                    onChanged: (value) {
                      name = value;
                    },
                  ),
                ),
                SizedBox(width: 12),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateColor.resolveWith(
                      (states) {
                        if (states.contains(WidgetState.pressed)) {
                          return Colors.white.withAlpha(120);
                        }
                        return Colors.white;
                      },
                    ),
                  ),
                  onPressed: () async {
                    print('submit');
                    setState(() {
                      game.scoreManager.canSubmit = false;
                    });
                    SharedPreferences.getInstance().then((preferences) async {
                      await preferences.setString('name', name);
                    });
                    await game.scoreManager.addHighScore(
                      HighScoreEntry(
                        name: name,
                        score: game.scoreManager.score,
                      ),
                    );
                    focusNode.requestFocus();
                  },
                  child: Text('Submit'),
                ),
              ],
            ),
        ],
      ),
    );
  }

  Widget _loyaltyLevelProgress() {
    TextStyle style = TextStyle(
      fontSize: 16,
      color: Colors.white,
    );
    final loyaltyLevel =
        LoyaltyLevels.fromScore(widget.game.scoreManager.score);

    if (loyaltyLevel == LoyaltyLevels.fly)
      return Text('You reached the top level! Fly onnnnn!');

    final nextLevel = LoyaltyLevels.values[loyaltyLevel.index + 1];
    final score = widget.game.scoreManager.score;
    final progress = score / nextLevel.threshold;
    final amountLeft = nextLevel.threshold - score;

    return Column(
      children: [
        LinearProgressIndicator(
          value: progress,
        ),
        SizedBox(height: 8),
        if (loyaltyLevel != LoyaltyLevels.fly)
          Text(
            '${amountLeft.round()} points left to [${nextLevel.name}] ',
            style: style.copyWith(),
          ),
      ],
    );
  }
}
