import 'package:ffgame/game.dart';
import 'package:ffgame/score_overlay.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// This example simply adds a rotating white square on the screen.
/// If you press on a square, it will be removed.
/// If you press anywhere else, another square will be added.
FocusNode focusNode = FocusNode();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Force Portrait Mode
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft, // Normal Portrait
  ]);

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
      ),
      home: GameWidget(
        game: FFGame(),
        focusNode: focusNode,
        // initialActiveOverlays: [ScoreOverlay.name],
        overlayBuilderMap: {
          ScoreOverlay.name: (context, FFGame game) {
            return ScoreOverlay(game: game);
          },
        },
      ),
    ),
  );
}
