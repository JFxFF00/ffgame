import 'package:ffgame/barrel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainMenu extends StatefulWidget {
  final FFGame game;
  const MainMenu({super.key, required this.game});

  static const name = 'Main menu';

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> with TickerProviderStateMixin {
  String name = '';
  TextEditingController nameController = TextEditingController();
  late SharedPreferences preferences;
  AnimationController? animationController;
  FocusNode nameFocusNode = FocusNode();

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
      lowerBound: 1.0,
      upperBound: 1.2,
      animationBehavior: AnimationBehavior.preserve,
    );
    animationController?.repeat();
    super.initState();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
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
            Expanded(child: _menu(widget.game)),
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
        Expanded(
          child: Text(
            '${placement}. ${entry.name}',
            overflow: TextOverflow.fade,
            maxLines: 1,
            style: style,
          ),
        ),
        Text('${entry.score.round()}', style: style),
      ],
    );
  }

  Widget _menu(FFGame game) {
    return Padding(
      padding: EdgeInsets.only(left: MediaQuery.sizeOf(context).width * 0.15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 20,
        children: [
          MainMenuButton(text: 'Play', onTap: () {}),
          MainMenuButton(text: 'Level select', onTap: () {}),
        ],
      ),
    );
  }
}
