import 'package:ffgame/challenge.dart';
import 'package:flame/components.dart';

abstract class FlippChallonge {
  static Challenge flippChallonge() {
    return Challenge(duration: 3, elements: [
      ChallengeElement.coin(Vector2(0, -60)),
      ChallengeElement.coin(Vector2(10, -60)),
      ChallengeElement.coin(Vector2(20, -60)),
      ChallengeElement.coin(Vector2(30, -60)),
      ChallengeElement.coin(Vector2(40, -60)),
      ChallengeElement.coin(Vector2(50, -60)),
      ChallengeElement.coin(Vector2(60, -60)),
      ChallengeElement.obstacle(50, amount: 2, size: 0.443),
      ChallengeElement.coin(Vector2(100, -120)),
      ChallengeElement.obstacle(300, amount: 20, size: 0.3),
    ]);
  }
}
