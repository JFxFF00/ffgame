import 'package:ffgame/barrel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LevelSelect extends StatelessWidget {
  final FFGame game;
  final VoidCallback onBack;
  const LevelSelect({super.key, required this.game, required this.onBack});

  @override
  Widget build(BuildContext context) {
    final style = GoogleFonts.novaMono(
      fontSize: 24,
      color: Colors.white,
    );

    final screenSize = MediaQuery.sizeOf(context);

    return Padding(
      padding: EdgeInsets.only(
        left: screenSize.width * 0.15,
        right: screenSize.width * 0.15,
        top: screenSize.height * 0.1,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: onBack,
                iconSize: 48,
                color: Colors.white,
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 12),
              Text(
                'Level select',
                style: style.copyWith(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 500),
            child: Divider(height: 1, color: Colors.white),
          ),
          Expanded(
              child: ListView(
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                SizedBox(height: 20),
                Text('Challenges', style: style),
                SizedBox(height: 4),
                ...Level.getChallenges().map(
                  (challenge) => _challenge(challenge),
                ),
              ]),
              for (final (index, level) in Level.getAllLevels().indexed)
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  SizedBox(height: 20),
                  Text('Level ${index + 1}', style: style),
                  SizedBox(height: 4),
                  ...level.challenges.map(
                    (challenge) => _challenge(challenge),
                  ),
                ]),
            ],
          )),
        ],
      ),
    );
  }

  Widget _challenge(Challenge challenge) {
    return InkWell(
      onTap: () {
        MainMenu.startGame(game, challengeId: challenge.id);
      },
      child: Text(
        challenge.name ?? 'unnamed',
        style: GoogleFonts.novaMono(
          fontSize: 16,
          color: Colors.white,
        ),
      ),
    );
  }
}
