import 'package:ffgame/game.dart';
import 'package:flame_audio/flame_audio.dart';

abstract class SoundManager {
  static String backgroundMusic = 'background.mp3';
  static bool on = true;

  static void playBackgroundMusic(FFGame game) {
    if (!on) return;
    try {
      FlameAudio.bgm.stop();
      FlameAudio.bgm.play(backgroundMusic, volume: 0.5);
    } catch (e) {
      print('Error playing background music: $e');
    }
  }

  static void pauseBackgroundMusic() {
    if (!on) return;

    FlameAudio.bgm.pause();
  }

  static void playSound(String sound) {
    if (!on) return;
    try {
      FlameAudio.play(sound, volume: 0.7);
    } catch (e) {
      print('Error playing coin pickup: $e');
    }
  }
}
