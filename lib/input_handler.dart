import 'package:ffgame/enums.dart';
import 'package:ffgame/game.dart';
import 'package:flame/components.dart';
import 'package:flutter/services.dart';

class InputHandler extends KeyboardListenerComponent
    with HasGameReference<FFGame> {
  InputHandler(FFGame game)
      : super(
          keyDown: {
            LogicalKeyboardKey.space: (_) {
              game.player.jump();
              return true;
            },
            LogicalKeyboardKey.arrowLeft: (_) {
              game.player.move(direction: Direction.left);
              return true;
            },
            LogicalKeyboardKey.arrowRight: (_) {
              game.player.move(direction: Direction.right);
              return true;
            },
            LogicalKeyboardKey.keyR: (_) {
              game.restart();
              return true;
            },
          },
          keyUp: {
            LogicalKeyboardKey.space: (_) {
              game.player.stopTimer();
              return true;
            },
            LogicalKeyboardKey.arrowLeft: (_) {
              game.player.stop(Direction.left);
              return true;
            },
            LogicalKeyboardKey.arrowRight: (_) {
              game.player.stop(Direction.right);
              return true;
            },
          },
        );

  void focus() {
    this.onLoad();
  }
}
