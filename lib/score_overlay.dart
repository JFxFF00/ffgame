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

class _ScoreOverlayState extends State<ScoreOverlay>
    with TickerProviderStateMixin {
  String name = '';
  TextEditingController nameController = TextEditingController();
  late SharedPreferences preferences;
  AnimationController? animationController;

  @override
  void initState() {
    init();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
      lowerBound: 0.9,
      upperBound: 1.1,
      value: 1,
    );
    animationController?.repeat();
    super.initState();
  }

  Future<void> init() async {
    preferences = await SharedPreferences.getInstance();
    name = preferences.getString('name') ?? '';
    nameController.text = name;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.black.withAlpha(60),
        child: Row(
          children: [
            Expanded(child: SizedBox()),
            Expanded(child: _runScore(widget.game)),
            Expanded(child: _highScores(widget.game)),
          ],
        ),
      ),
    );
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.black.withAlpha(180),
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
        decoration: _boxDecoration(),
        child: Column(
          spacing: 4,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'High Scores',
              style: style.copyWith(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Divider(color: Colors.white54),
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
    final double width = 280;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: width,
          padding: EdgeInsets.all(20),
          decoration: _boxDecoration(),
          child: Column(
            spacing: 12,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Game over',
                style:
                    style.copyWith(fontSize: 32, fontWeight: FontWeight.bold),
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
            ],
          ),
        ),
        if (game.scoreManager.canSubmit)
          Container(
            margin: EdgeInsets.only(top: 20),
            width: width,
            padding: EdgeInsets.all(20),
            decoration: _boxDecoration(),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: nameController,
                    // style: TextStyle(
                    //   color: Colors
                    // ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Name...',
                      hintStyle: TextStyle(color: Colors.black45),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                    onChanged: (value) {
                      name = value;
                    },
                  ),
                ),
                SizedBox(width: 12),
                SizedBox(
                  width: 80,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor:
                          Theme.of(context).colorScheme.inversePrimary,
                    ),
                    onPressed: () async {
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
                ),
              ],
            ),
          ),
        SizedBox(height: 8),
        Text(
          'Press space to restart',
          style: TextStyle(color: Colors.white),
        ),
      ],
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
