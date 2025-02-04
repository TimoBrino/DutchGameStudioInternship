import 'package:flame/components.dart';

import '../runAndJump.dart';

class Player extends SpriteAnimationComponent
    with HasGameReference<RunAndJump> {
  Player({
    required super.position,
  }) : super(size: Vector2.all(64), anchor: Anchor.center);

  @override
  void onLoad() {
    animation = SpriteAnimation.fromFrameData(
      game.images.fromCache('dudeMonsterRun.png'),
      SpriteAnimationData.sequenced(
        amount: 6,
        stepTime: 0.12,
        textureSize: Vector2.all(16),
      ),
    );
  }
}
