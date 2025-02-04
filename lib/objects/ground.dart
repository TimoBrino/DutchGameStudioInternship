import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

import '../runAndJump.dart';

class Ground extends SpriteComponent with HasGameReference<RunAndJump>{
final Vector2 gridPosition;
  double xOffset;
  final Vector2 velocity = Vector2.zero();

  Ground({
    required this.gridPosition,
    required this.xOffset,
  }) : super(size: Vector2.all(64), anchor: Anchor.bottomLeft);

  @override
  void onLoad() {
    final platformImage = game.images.fromCache('ground.png');
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
    super.update(dt);
  }
}

  
