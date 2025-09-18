import 'dart:async';
import 'dart:ui';
import 'package:ffgame/barrel.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/foundation.dart';
import 'package:google_fonts/google_fonts.dart';

class FFGame extends FlameGame
    with HasKeyboardHandlerComponents, HasCollisionDetection {
  static late double groundYPosition;

  GameState gameState = GameState.playing;
  ImageHolder imageHolder = ImageHolder();

  TextComponent scoreText = TextComponent();
  TextComponent levelText = TextComponent();
  TextComponent levelProgressText = TextComponent();
  TextComponent challengeNameText = TextComponent();
  TextComponent highScoreText = TextComponent(anchor: Anchor.centerLeft);
  FpsTextComponent fps = FpsTextComponent(
    anchor: Anchor.centerRight,
    scale: Vector2.all(0.5),
  );
  Player player = Player();
  ObstacleManager obstacleManager = ObstacleManager();
  ScoreManager scoreManager = ScoreManager();
  double duration = 0;
  double speed = GameBalance.gameSpeed;
  int level = 1;
  int challengesCompleted = 0;

  late Vector2 playerStart;
  late InputHandler inputHandler;

  @override
  void lifecycleStateChange(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      SoundManager.playBackgroundMusic(this);
    } else {
      SoundManager.pauseBackgroundMusic();
    }
    super.lifecycleStateChange(state);
  }

  @override
  FutureOr<void> onLoad() async {
    await imageHolder.load();
    await scoreManager.getHighScores();
    await GoogleFonts.pendingFonts([
      GoogleFonts.novaMono(),
      GoogleFonts.notoSansMono(),
    ]);
    groundYPosition = size.y * 0.65;
    SoundManager.playBackgroundMusic(this);

    camera.viewfinder.anchor = Anchor.topLeft;
    inputHandler = InputHandler(this);

    setupPlayArea();

    return super.onLoad();
  }

  @override
  void update(double dt) {
    if (gameState == GameState.playing) {
      duration += dt;
      scoreManager.addScore(dt * speed * GameBalance.scoreFromDistance);
      int challengesToComplete = GameBalance.challengesToNextLevel;
      if (level == 1) {
        challengesToComplete = GameBalance.challengesOnLevel1;
      }
      final challengeX = '█' * challengesCompleted;
      final challengeO = '-' * (challengesToComplete - challengesCompleted - 1);
      levelText.text = 'Level ${levelWithTitle(level)}';
      levelProgressText.text = '$challengeX$challengeO';
      scoreText.text = 'Score ${scoreManager.score.round()}';
    }
    super.update(dt);
  }

  void setupPlayArea() {
    playerStart = Vector2(
      centerLeft.x + 200,
      groundYPosition - player.size.y / 2,
    );
    player.position = playerStart;
    obstacleManager.position = Vector2(
      bottomRight.x,
      groundYPosition,
    );

    final levelTextPosition =
        Vector2(50, size.y - (size.y - groundYPosition) / 2);

    levelText.position = levelTextPosition + Vector2(0, -65);
    levelProgressText.position = levelTextPosition + Vector2(0, -32);
    challengeNameText.position = levelTextPosition;
    scoreText.position = levelTextPosition + Vector2(0, 50);

    levelText.textRenderer = Texts.mono;
    challengeNameText.textRenderer = Texts.monoWeak;
    levelProgressText.textRenderer = Texts.actualMono;
    scoreText.textRenderer = Texts.monoSmall;

    fps.position = Vector2(-20, 40);

    world.add(inputHandler);
    world.add(PlayArea());
    world.add(player);
    world.add(Shadow(player: player));
    world.add(obstacleManager);
    world.add(scoreText);
    world.add(levelProgressText);
    world.add(challengeNameText);
    world.add(levelText);
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

    SoundManager.pauseBackgroundMusic();

    highScoreText.text = '';
    scoreText.text = '';
    await scoreManager.getHighScores();
    scoreManager.canSubmit = true;
    scoreManager.showScores(this);
  }

  void restart() {
    duration = 0;
    level = 1;
    challengesCompleted = 0;
    scoreManager.newGame();
    obstacleManager.reset();
    world.removeWhere((element) => element is Obstacle);
    world.removeWhere((element) => element is Coin);
    world.removeWhere((element) => element is Bird);
    world.removeWhere((element) => element is Cash);
    player.position = playerStart;
    speed = GameBalance.gameSpeed;
    highScoreText.text =
        'High Score: ${scoreWithTitle(scoreManager.highScore.score)}';
    gameState = GameState.playing;
    scoreManager.hideScores(this);
    SoundManager.playBackgroundMusic(this);
  }
}
