import 'dart:async';
import 'package:ffgame/image_holder.dart';
import 'package:ffgame/obstacle.dart';
import 'package:ffgame/obstacle_manager.dart';
import 'package:ffgame/play_area.dart';
import 'package:ffgame/player.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/image_composition.dart';
import 'package:flame/text.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/services/hardware_keyboard.dart';
import 'package:flutter/src/widgets/focus_manager.dart';

class FFGame extends FlameGame with HasCollisionDetection, KeyboardEvents {
  FFGame() : super();
  ImageHolder imageHolder = ImageHolder();
  TextComponent score = TextComponent();
  Player player = Player();
  ObstacleManager obstacleManager = ObstacleManager();
  double duration = 0;

  @override
  FutureOr<void> onLoad() async {
    await imageHolder.load();

    world.add(player);
    player.position = Vector2(-500, 0);
    var obs = ObstacleManager()..position = Vector2(500, 0);
    world.add(obs);
    add(PlayArea());
    world.add(score);
    score.position = Vector2(-532, 100);

    return super.onLoad();
  }

  void restart() {
    duration = 0;
    obstacleManager.reset();
    removeAll(children.where((element) => element is Obstacle));
  }

  @override
  void update(double dt) {
    duration += dt;
    score.text = 'Score: ${duration.round()}';
    super.update(dt);
  }

  @override
  KeyEventResult onKeyEvent(
    KeyEvent event,
    Set<LogicalKeyboardKey> keysPressed,
  ) {
    if (keysPressed.contains(LogicalKeyboardKey.space)) {
      player.jump();
    }
    if (keysPressed.contains(LogicalKeyboardKey.keyR)) {
      restart();
    }
    return super.onKeyEvent(event, keysPressed);
  }
}
