import 'package:ffgame/game.dart';
import 'package:flame/components.dart';

class Shadow extends SpriteComponent with HasGameReference<FFGame> {
  Shadow() : super(size: Vector2(64, 64));
}
