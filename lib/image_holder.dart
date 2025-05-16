import 'package:flame/flame.dart';
import 'package:flame/image_composition.dart';

///
///    - assets/images/left_pressed.png
// - assets/images/left_default.png
// - assets/images/right_pressed.png
// - assets/images/right_default.png
class ImageHolder {
  late Image characterImage;
  late Image obstacleImage;
  late Image coinImage;
  late Image leftPressed;
  late Image leftDefault;
  late Image rightPressed;
  late Image rightDefault;

  Future<void> load() async {
    // characterImage = await Flame.images.load('ff_logga.png');
    characterImage = await Flame.images.load('ff_ball.png');
    obstacleImage = await Flame.images.load('fire.png');
    coinImage = await Flame.images.load('coin.png');
    leftPressed = await Flame.images.load('left_pressed.png');
    leftDefault = await Flame.images.load('left_default.png');
    rightPressed = await Flame.images.load('right_pressed.png');
    rightDefault = await Flame.images.load('right_default.png');
  }
}
