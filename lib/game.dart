import 'dart:async';
import 'dart:ui';
import 'package:ffgame/enums.dart';
import 'package:ffgame/game_balance.dart';
import 'package:ffgame/helpers.dart';
import 'package:ffgame/high_score.dart';
import 'package:ffgame/image_holder.dart';
import 'package:ffgame/input_handler.dart';
import 'package:ffgame/music_manager.dart';
import 'package:ffgame/obstacle_manager.dart';
import 'package:ffgame/play_area.dart';
import 'package:ffgame/player.dart';
import 'package:ffgame/tap_button.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/foundation.dart';

class FFGame extends FlameGame
    with HasKeyboardHandlerComponents, HasCollisionDetection {
  GameState gameState = GameState.playing;
  ImageHolder imageHolder = ImageHolder();
  TextComponent scoreText = TextComponent(anchor: Anchor.center);
  TextComponent highScoreText = TextComponent(anchor: Anchor.centerLeft);
  FpsTextComponent fps = FpsTextComponent(
    anchor: Anchor.centerRight,
    scale: Vector2.all(0.5),
  );
  Player player = Player();
  ObstacleManager obstacleManager = ObstacleManager();
  ScoreManager scoreManager = ScoreManager();
  double duration = 0;
  double get groundPosition => size.y * 0.35;
  double speed = GameBalance.gameSpeedBase;

  late Vector2 startPosition;
  late InputHandler inputHandler;

  @override
  void lifecycleStateChange(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      MusicManager.playBackgroundMusic(this);
    } else {
      MusicManager.pauseBackgroundMusic();
    }
    super.lifecycleStateChange(state);
  }

  @override
  FutureOr<void> onLoad() async {
    await imageHolder.load();
    await scoreManager.getHighScores();
    MusicManager.playBackgroundMusic(this);

    camera.viewfinder.anchor = Anchor.topLeft;
    inputHandler = InputHandler(this);

    setupPlayArea();

    return super.onLoad();
  }

  @override
  void update(double dt) {
    if (gameState == GameState.playing) {
      duration += dt;
      scoreManager.addScore(dt * speed * 0.4);
      scoreText.text = 'Lojalitetspoäng: ${scoreWithTitle(scoreManager.score)}';
      speed += dt * GameBalance.gamesSpeedIncrease;
    }
    super.update(dt);
  }

  void setupPlayArea() {
    startPosition = Vector2(
      centerLeft.x + 200,
      size.y - groundPosition - player.size.y / 2,
    );
    player.position = startPosition;
    obstacleManager.position = Vector2(
      bottomRight.x,
      size.y - groundPosition,
    );
    scoreText.position = Vector2(size.x / 2, size.y - groundPosition / 2);
    fps.position = Vector2(-20, 40);

    world.add(inputHandler);
    world.add(PlayArea());
    world.add(player);
    world.add(obstacleManager);
    world.add(scoreText);
    world.add(fps);

    if (!kIsWeb) {
      world
          .add(TapButtons.left(this)..position = bottomLeft + Vector2(60, -60));
      world.add(
          TapButtons.right(this)..position = bottomLeft + Vector2(140, -60));
    }
  }

  void end() async {
    gameState = GameState.scoreScreen;
    speed = 0;

    MusicManager.pauseBackgroundMusic();

    highScoreText.text = '';
    scoreText.text = '';
    await scoreManager.getHighScores();
    scoreManager.canSubmit = true;
    scoreManager.showScores(this);
  }

  void restart() {
    duration = 0;
    scoreManager.newGame();
    obstacleManager.reset();
    player.position = startPosition;
    speed = GameBalance.gameSpeedBase;
    highScoreText.text =
        'High Score: ${scoreWithTitle(scoreManager.highScore.score)}';
    gameState = GameState.playing;
    scoreManager.hideScores(this);
    MusicManager.playBackgroundMusic(this);
  }
}
