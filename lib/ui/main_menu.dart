import 'package:ffgame/barrel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:universal_html/html.dart' as html;

class MainMenu extends StatefulWidget {
  final FFGame game;
  const MainMenu({super.key, required this.game});

  static const name = 'Main menu';

  static void startGame(FFGame game, {String? challengeId}) {
    if (challengeId == null) {
      html.window.history.pushState(null, '', '/');
    } else {
      html.window.history.pushState(
        null,
        '',
        'challenges?id=${challengeId}',
      );
    }
    game.start();
  }

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> with TickerProviderStateMixin {
  _State state = _State.main;
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
        child: switch (state) {
          _State.main => _mainMenu(widget.game),
          _State.levelSelect => LevelSelect(
              game: widget.game,
              onBack: () => setState(() => state = _State.main),
            ),
        },
      ),
    );
  }

  Widget _mainMenu(FFGame game) {
    return Row(
      children: [
        Expanded(child: _menu(widget.game)),
        Expanded(child: HighScoreTable(game: widget.game)),
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
          Container(
            width: 600,
            padding: EdgeInsets.only(left: 8),
            child: Image.asset(
              'assets/images/logo.png',
              fit: BoxFit.contain,
            ),
          ),
          MainMenuButton(
            text: 'Play',
            onTap: () => MainMenu.startGame(game),
          ),
          MainMenuButton(
            text: 'Level select',
            onTap: () {
              setState(() => state = _State.levelSelect);
            },
          ),
        ],
      ),
    );
  }
}

enum _State {
  main,
  levelSelect,
}
