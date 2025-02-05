import 'package:dutch_game_studio_game/actors/slime.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flutter/services.dart';

import '../runAndJump.dart';
import '../objects/ground.dart';
import '../objects/platform.dart';

class Player extends SpriteAnimationComponent
    with KeyboardHandler, CollisionCallbacks, HasGameReference<RunAndJump> {
  int horizontalDirecton = 0;
  bool isOnGround = false;
  bool hasJumped = false;
  bool hitByEnemy = false;
  final Vector2 velocity = Vector2.zero();
  final double moveSpeed = 200;
  final Vector2 fromAbove = Vector2(0, -1);
  final double gravity = 15;
  final double jumpSpeed = 800;
  final double terminalVelocity = 300;

  Player({
    required super.position,
  }) : super(size: Vector2.all(64), anchor: Anchor.center);

  @override
  void onLoad() {
    add(CircleHitbox());
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
    hasJumped = keysPressed.contains(LogicalKeyboardKey.space);
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
    velocity.y += gravity;

    if (hasJumped) {
      if (isOnGround) {
        velocity.y = -jumpSpeed;
        isOnGround = false;
      }
      hasJumped = false;
    }
    velocity.y = velocity.y.clamp(-jumpSpeed, terminalVelocity);
    super.update(dt);
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    if (other is Ground || other is Platform) {
      if (intersectionPoints.length == 2) {
        final mid = (intersectionPoints.elementAt(0) +
                intersectionPoints.elementAt(1)) /
            2;
        final collisionNormal = absoluteCenter - mid;
        final seperationDistance = (size.x / 2) - collisionNormal.length;
        collisionNormal.normalize();

        if (fromAbove.dot(collisionNormal) > 0.9) {
          isOnGround = true;
        }

        position += collisionNormal.scaled(seperationDistance);
      }
    }
    if (other is Slime) {
      hit();
    }

    super.onCollision(intersectionPoints, other);
  }

  void hit() {
    if (!hitByEnemy) {
      hitByEnemy = true;
    }
    add(
      OpacityEffect.fadeOut(
        EffectController(
          alternate: true,
          duration: 0.1,
          repeatCount: 6,
        ),
      )..onComplete = () {
          hitByEnemy = false;
        },
    );
  }
}
