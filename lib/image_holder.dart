import 'package:flame/flame.dart';
import 'package:flame/image_composition.dart';

class ImageHolder {
  late Image characterImage;
  late Image obstacleImage;

  Future<void> load() async {
    characterImage = await Flame.images.load('ff_logga.png');
    obstacleImage = await Flame.images.load('fire.png');
  }
}
