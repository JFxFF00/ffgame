import 'package:ffgame/game.dart';
import 'package:flame_audio/flame_audio.dart';

abstract class MusicManager {
  static String backgroundMusic = 'background.mp3';

  static void playBackgroundMusic(FFGame game) {
    try {
      FlameAudio.bgm.stop();
      FlameAudio.bgm.play(backgroundMusic, volume: 0.5);
    } catch (e) {
      print('Error playing background music: $e');
    }
  }

  static void pauseBackgroundMusic() {
    FlameAudio.bgm.pause();
  }
}
