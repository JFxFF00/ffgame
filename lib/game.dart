import 'dart:async';
import 'dart:ui';
import 'package:ffgame/game_balance.dart';
import 'package:ffgame/helpers.dart';
import 'package:ffgame/high_score.dart';
import 'package:ffgame/image_holder.dart';
import 'package:ffgame/input_handler.dart';
import 'package:ffgame/obstacle_manager.dart';
import 'package:ffgame/play_area.dart';
import 'package:ffgame/player.dart';
import 'package:ffgame/tap_button.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/foundation.dart';

class FFGame extends FlameGame
    with HasKeyboardHandlerComponents, HasCollisionDetection {
  FFGame() : super();
  ImageHolder imageHolder = ImageHolder();
  TextComponent scoreText = TextComponent(anchor: Anchor.center);
  TextComponent highscoreText = TextComponent(anchor: Anchor.centerLeft);
  FpsTextComponent fps =
      FpsTextComponent(anchor: Anchor.centerRight, scale: Vector2.all(0.5));
  Player player = Player();
  ObstacleManager obstacleManager = ObstacleManager();
  double duration = 0;
  double score = 0;
  double highScore = 0;
  double get groundPosition => size.y * 0.2;
  double speed = GameBalance.gameSpeedBase;

  late Vector2 startPosition;

  @override
  void lifecycleStateChange(AppLifecycleState state) {
    // try {
    //   if (state == AppLifecycleState.resumed) {
    //     FlameAudio.bgm.play(
    //       'background.mp3',
    //       volume: 0.5,
    //     );
    //   }
    //   FlameAudio.bgm.pause();
    // } catch (e) {
    //   print('Error in lifecycleStateChange: $e');
    // }
    super.lifecycleStateChange(state);
  }

  @override
  FutureOr<void> onLoad() async {
    await imageHolder.load();
    // debugMode = true;

    // try {
    //   FlameAudio.bgm.play(
    //     'background.mp3',
    //     volume: 0.5,
    //   );
    // } catch (e) {
    //   print('Error playing background music: $e');
    // }
    highScore = await getHighScore();
    highscoreText.text = 'Highscore: ${scoreWithTitle(highScore)}';

    startPosition =
        Vector2(centerLeft.x + 100, groundPosition - (player.size.y / 2));
    player.position = startPosition;
    world.add(player);
    world.add(InputHandler(this));
    var obs = obstacleManager
      ..position = Vector2(bottomRight.x, groundPosition);
    world.add(obs);
    add(PlayArea());
    world.add(scoreText);
    scoreText.position = Vector2(0, groundPosition + size.y * 0.15);
    world.add(highscoreText);
    highscoreText.position = topLeft + Vector2(20, 40);
    world.add(fps);
    fps.position = topRight + Vector2(-20, 40);

    if (!kIsWeb) {
      world
          .add(TapButtons.left(this)..position = bottomLeft + Vector2(60, -60));
      world.add(
          TapButtons.right(this)..position = bottomLeft + Vector2(140, -60));
    }

    return super.onLoad();
  }

  void end() async {
    print('Your final score is: ${score.round()}');
    pauseEngine();
    FlameAudio.bgm.stop();
    final newHighscore = await setHighScore(score);
    highscoreText.text = 'Highscore: ${scoreWithTitle(newHighscore)}';
    // final highscores = await HighScoreManager().getHighScores();
    // print(highscores);
    // HighScoreManager().addHighScore(HighScoreEntry(name: 'John', score: score));

    Future.delayed(
      Duration(seconds: 3),
      () {
        resumeEngine();
        restart();
      },
    );
  }

  void restart() {
    duration = 0;
    score = 0;
    speed = GameBalance.gameSpeedBase;
    obstacleManager.reset();
    player.position = startPosition;
    // FlameAudio.bgm.play(
    //   'background.mp3',
    //   volume: 0.5,
    // );
  }

  @override
  void update(double dt) {
    duration += dt;
    score += dt * speed * 0.4;
    scoreText.text = 'Lojalitetspoäng: ${scoreWithTitle(score)}';
    speed += dt * GameBalance.gamesSpeedIncrease;
    super.update(dt);
  }
}
