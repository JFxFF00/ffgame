import 'dart:math';

import 'package:ffgame/barrel.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/extensions.dart';

abstract class TapButtons {
  static TapButton right(FFGame game) {
    return TapButton(
      onTap: (event) {
        game.player.move(direction: Direction.right);
      },
      onTapRelease: (event) {
        game.player.stop(Direction.right);
      },
      spriteImage: game.imageHolder.rightDefault,
      onTapSprite: game.imageHolder.rightPressed,
    );
  }

  static TapButton left(FFGame game) {
    return TapButton(
      onTap: (event) {
        game.player.move();
      },
      onTapRelease: (event) {
        game.player.stop(Direction.left);
      },
      spriteImage: game.imageHolder.leftDefault,
      onTapSprite: game.imageHolder.leftPressed,
    );
  }
}

class TapButton extends SpriteComponent with TapCallbacks {
  final Function(TapDownEvent) onTap;
  final Function(TapUpEvent) onTapRelease;
  final Image spriteImage;
  final Image? onTapSprite;
  TapButton({
    required this.onTap,
    required this.onTapRelease,
    required this.spriteImage,
    this.onTapSprite,
  }) : super(
          size: Vector2(64, 64),
          anchor: Anchor.center,
        );

  @override
  Future<void> onLoad() async {
    sprite = Sprite(spriteImage);
    return super.onLoad();
  }

  @override
  void onTapDown(TapDownEvent event) {
    onTap(event);
    if (onTapSprite != null) {
      sprite = Sprite(onTapSprite!);
    }
  }

  @override
  void onTapUp(TapUpEvent event) {
    onTapRelease(event);
    if (onTapSprite != null) {
      sprite = Sprite(spriteImage);
    }
  }
}
