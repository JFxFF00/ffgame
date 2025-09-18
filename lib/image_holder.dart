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
  late Image cash;
  late Image leftPressed;
  late Image leftDefault;
  late Image rightPressed;
  late Image rightDefault;
  late Image leavesSeamless;
  late Image grass;
  late Image sky;
  late Image bird;
  late Image birdFly1;
  late Image birdFly2;
  late Image birdFly3;
  late Image buildings1;
  late Image shadow;
  late Image shadowAlternative;

  Future<void> load() async {
    // characterImage = await Flame.images.load('ff_logga.png');
    characterImage = await Flame.images.load('ff_ball.png');
    obstacleImage = await Flame.images.load('fire.png');
    coinImage = await Flame.images.load('coin.png');
    leftPressed = await Flame.images.load('left_pressed.png');
    leftDefault = await Flame.images.load('left_default.png');
    rightPressed = await Flame.images.load('right_pressed.png');
    rightDefault = await Flame.images.load('right_default.png');
    leavesSeamless = await Flame.images.load('leaves_seamless.jpg');
    grass = await Flame.images.load('grass.png');
    sky = await Flame.images.load('sky.jpg');
    buildings1 = await Flame.images.load('buildings1.png');
    bird = await Flame.images.load('bird.png');
    birdFly1 = await Flame.images.load('bird_fly_1.png');
    birdFly2 = await Flame.images.load('bird_fly_2.png');
    birdFly3 = await Flame.images.load('bird_fly_3.png');
    shadow = await Flame.images.load('shadow.png');
    shadowAlternative = await Flame.images.load('shadow_alternative.png');
    cash = await Flame.images.load('cash.png');
  }
}
