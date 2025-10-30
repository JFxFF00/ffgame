import 'dart:async';
import 'dart:ui';
import 'package:ffgame/barrel.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/foundation.dart';
import 'package:universal_html/html.dart' as html;
import 'package:google_fonts/google_fonts.dart';

class FFGame extends FlameGame
    with HasKeyboardHandlerComponents, HasCollisionDetection {
  static late double groundYPosition;

  GameState gameState = GameState.playing;
  ImageHolder imageHolder = ImageHolder();
  Challenge? challenge;

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
  double get speed {
    return GameBalance.gameSpeed * speedFromTrack * speedFromLevel;
  }

  double speedFromTrack = 1;
  double speedFromLevel = 1;
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

    _checkForChallenge();
    if (challenge != null) {
      start();
    }

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

      if (speedFromTrack > 1) {
        final deAcceleration = 0.6 * speedFromTrack * dt;
        speedFromTrack -= deAcceleration;
        if (speedFromTrack < 1) {
          speedFromTrack = 1;
        }
      }
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
  }

  void start() {
    _checkForChallenge();
    duration = 0;
    level = 1;
    challengesCompleted = 0;
    obstacleManager = ObstacleManager(challenge: challenge);
    scoreManager = ScoreManager();
    scoreManager.canSubmit = challenge == null;
    print(scoreManager.canSubmit);
    gameState = GameState.playing;
    gameFocus.requestFocus();

    SoundManager.playBackgroundMusic(this);
    highScoreText.text =
        'High Score: ${scoreWithTitle(scoreManager.highScore.score)}';

    overlays.clear();
    scoreManager.newGame();
    obstacleManager.reset();
    player.position = playerStart;
    world.add(obstacleManager);
    world.add(scoreText);
    world.add(levelProgressText);
    world.add(challengeNameText);
    world.add(levelText);
    world.add(fps);

    if (!kIsWeb) {
      world.add(
        TapButtons.left(this)..position = bottomLeft + Vector2(60, -60),
      );
      world.add(
        TapButtons.right(this)..position = bottomLeft + Vector2(140, -60),
      );
    }
  }

  Future<void> end() async {
    if (gameState == GameState.scoreScreen) {
      return;
    }

    gameState = GameState.scoreScreen;
    speedFromLevel = 0;
    speedFromTrack = 1;

    SoundManager.pauseBackgroundMusic();

    highScoreText.text = '';
    scoreText.text = '';
    await scoreManager.getHighScores();
    scoreManager.showScores(this);
    world.remove(obstacleManager);
    world.remove(scoreText);
    world.remove(levelProgressText);
    world.remove(challengeNameText);
    world.remove(levelText);
    world.remove(fps);
    world.removeWhere((element) => element is Obstacle);
    world.removeWhere((element) => element is Coin);
    world.removeWhere((element) => element is Bird);
    world.removeWhere((element) => element is Cash);
    world.removeWhere((element) => element is SpeedTrack);
  }

  void _checkForChallenge() {
    final href = html.window.location.href;
    final challengeId = Uri.parse(href).queryParameters['id'] ?? '';
    final challenge = Level.getChallengeFromId(challengeId);
    this.challenge = challenge;
  }
}
