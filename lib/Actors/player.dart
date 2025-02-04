import 'package:flame/components.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import '../runAndJump.dart';

class Player extends SpriteAnimationComponent
    with KeyboardHandler, HasGameReference<RunAndJump> {
  int horizontalDirecton = 0;
  final Vector2 velocity = Vector2.zero();
  final double moveSpeed = 200;

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
        textureSize: Vector2.all(32),
      ),
    );
  }

  @override
  bool onKeyEvent(KeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    horizontalDirecton = 0;
    horizontalDirecton += (keysPressed.contains(LogicalKeyboardKey.keyA) ||
            keysPressed.contains(LogicalKeyboardKey.arrowLeft))
        ? -1
        : 0;
    horizontalDirecton += (keysPressed.contains(LogicalKeyboardKey.keyD) ||
            keysPressed.contains(LogicalKeyboardKey.arrowRight))
        ? 1
        : 0;
    return true;
  }

  @override
  void update(double dt) {
    velocity.x = horizontalDirecton * moveSpeed;
    position += velocity * dt;
    if (horizontalDirecton < 0 && scale.x > 0) {
      flipHorizontally();
    } else if (horizontalDirecton > 0 && scale.x < 0) {
      flipHorizontally();
    }
    super.update(dt);
  }
}
