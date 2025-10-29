import 'package:ffgame/barrel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
  FocusNode nameFocusNode = FocusNode();

  @override
  void initState() {
    init();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
      lowerBound: 1.0,
      upperBound: 1.2,
      animationBehavior: AnimationBehavior.preserve,
    );
    nameFocusNode.addListener(_handleFocus);
    animationController?.repeat();
    super.initState();
  }

  @override
  void dispose() {
    nameFocusNode.removeListener(_handleFocus);
    animationController?.dispose();
    super.dispose();
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
            Expanded(
              child: widget.game.challenge == null
                  ? HighScoreTable(game: widget.game)
                  : SizedBox(),
            ),
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

  Widget _runScore(FFGame game) {
    TextStyle style = GoogleFonts.notoSansMono(
      fontSize: 20,
      color: Colors.white,
    );
    final scoreManager = game.scoreManager;
    final LoyaltyLevels loyaltyLevel = LoyaltyLevels.fromLevel(game.level);
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
              Divider(color: Colors.white54),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Money',
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
                    'Level ${game.level}',
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
              // _loyaltyLevelProgress(),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 20),
          width: width,
          padding: EdgeInsets.all(20),
          decoration: _boxDecoration(),
          child: Column(
            children: [
              if (game.scoreManager.canSubmit)
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          focusNode: nameFocusNode,
                          controller: nameController,
                          style: GoogleFonts.notoSansMono(),
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
                        height: 46, // size of text field
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor:
                                Theme.of(context).colorScheme.inversePrimary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3),
                            ),
                          ),
                          onPressed: () async {
                            setState(() {
                              game.scoreManager.canSubmit = false;
                            });
                            SharedPreferences.getInstance()
                                .then((preferences) async {
                              await preferences.setString('name', name);
                            });
                            await game.scoreManager.addHighScore(
                              HighScoreEntry(
                                name: name,
                                score: game.scoreManager.score,
                              ),
                            );
                            gameFocus.requestFocus();
                          },
                          child: Text(
                            'Submit',
                            style: GoogleFonts.notoSansMono(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              Container(
                width: width,
                height: 46,
                child: TextButton(
                  style: TextButton.styleFrom(
                    overlayColor: Colors.white,
                    backgroundColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3),
                      side: BorderSide(color: Colors.white),
                    ),
                  ),
                  onPressed: () async {
                    game.overlays.remove(ScoreOverlay.name);
                    game.overlays.add(MainMenu.name);
                  },
                  child: Text(
                    'Back to main menu',
                    style: GoogleFonts.notoSansMono(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 8),
        AnimatedScale(
          scale: animationController?.value ?? 1,
          duration: Duration(milliseconds: 1000),
          child: Text(
            'Press "R" to restart',
            style: GoogleFonts.notoSansMono(color: Colors.white),
          ),
        ),
      ],
    );
  }

  // Widget _loyaltyLevelProgress() {
  //   TextStyle style = TextStyle(
  //     fontSize: 16,
  //     color: Colors.white,
  //   );
  //   final loyaltyLevel =
  //       LoyaltyLevels.fromScore(widget.game.scoreManager.score);

  //   if (loyaltyLevel == LoyaltyLevels.fly)
  //     return Text('You reached the top level! Fly onnnnn!');

  //   final nextLevel = LoyaltyLevels.values[loyaltyLevel.index + 1];
  //   final score = widget.game.scoreManager.score;
  //   final progress = score / nextLevel.threshold;
  //   final amountLeft = nextLevel.threshold - score;

  //   return Column(
  //     children: [
  //       LinearProgressIndicator(
  //         value: progress,
  //       ),
  //       SizedBox(height: 8),
  //       if (loyaltyLevel != LoyaltyLevels.fly)
  //         Text(
  //           '${amountLeft.round()} points left to [${nextLevel.name}] ',
  //           style: style.copyWith(),
  //         ),
  //     ],
  //   );
  // }

  void _handleFocus() {
    if (!nameFocusNode.hasFocus) {
      gameFocus.requestFocus();
    }
  }
}
