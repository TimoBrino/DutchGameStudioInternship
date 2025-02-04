import 'package:dutch_game_studio_game/runAndJump.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';

class Slime extends SpriteAnimationComponent with HasGameReference<RunAndJump> {
  final Vector2 gridPosition;
  double xOffset;

  final Vector2 velocity = Vector2.zero();

  Slime({
    required this.gridPosition,
    required this.xOffset,
  }) : super(size: Vector2.all(64), anchor: Anchor.bottomLeft);

  @override
  void onLoad() {
    animation = SpriteAnimation.fromFrameData(
      game.images.fromCache('greenSlimeWalk.png'),
      SpriteAnimationData.sequenced(
        amount: 8,
        stepTime: 0.12,
        textureSize: Vector2.all(128),
      ),
    );
    position = Vector2(
      (gridPosition.x * size.x) + xOffset,
      game.size.y - (gridPosition.y * size.y),
    );
    add(RectangleHitbox(collisionType: CollisionType.passive));
    add(
      MoveEffect.by(
        Vector2(-2 * size.x, 0),
        EffectController(
          duration: 3,
          alternate: true,
          infinite: true,
        ),
      ),
    );
  }
    @override
    void update(double dt) {
      velocity.x = game.objectSpeed;
      position += velocity * dt;
      if (position.x < -size.x) removeFromParent();
      super.update(dt);
    }
  }

