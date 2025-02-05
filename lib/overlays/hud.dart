import 'package:dutch_game_studio_game/overlays/lives.dart';
import 'package:dutch_game_studio_game/runAndJump.dart';
import 'package:flame/components.dart';

class Hud extends PositionComponent with HasGameReference<RunAndJump> {
  Hud({
    super.position,
    super.size,
    super.scale,
    super.angle,
    super.anchor,
    super.children,
    super.priority = 5,
  });

  // late TextComponent _scoreTextComponent;

  @override
  Future<void> onLoad() async {
    for (var i = 1; i <= game.lives; i++) {
      final positionX = 40 * i;
      await add(
        LivesHealthComponent(
          livesNumber: i,
          position: Vector2(positionX.toDouble(), 20),
          size: Vector2.all(32),
        ),
      );
    }
  }
}
