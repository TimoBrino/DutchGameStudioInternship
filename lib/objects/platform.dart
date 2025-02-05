import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

import '../run_and_jump.dart';

class Platform extends SpriteComponent with HasGameReference<RunAndJump> {
  final Vector2 gridPosition;
  double xOffset;
  final Vector2 velocity = Vector2.zero();

  Platform({
    required this.gridPosition,
    required this.xOffset,
  }) : super(size: Vector2.all(64), anchor: Anchor.bottomLeft);

  @override
  void onLoad() {
    final platformImage = game.images.fromCache('platform.png');
    sprite = Sprite(platformImage);
    position = Vector2((gridPosition.x * size.x) + xOffset,
        game.size.y - (gridPosition.y * size.y),
    );
    add(RectangleHitbox(collisionType: CollisionType.passive));
  }

  @override
  void update(double dt) {
    velocity.x = game.objectSpeed;
    position += velocity * dt;
    if (position.x < -size.x) removeFromParent();
    if (position.x < -size.x || game.lives <= 0) {
      removeFromParent();
    }
    super.update(dt);
  }
}