import 'package:ffgame/barrel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HighScoreTable extends StatelessWidget {
  final FFGame game;
  const HighScoreTable({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    final TextStyle style = GoogleFonts.notoSansMono(
      fontSize: 18,
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
    TextStyle style = GoogleFonts.notoSansMono(
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

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.black.withAlpha(180),
    );
  }
}
