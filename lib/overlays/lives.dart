import 'package:dutch_game_studio_game/runAndJump.dart';
import 'package:flame/components.dart';

enum LivesState {
  available,
  unavailable,
}

class LivesHealthComponent extends SpriteGroupComponent<LivesState>
    with HasGameReference<RunAndJump> {
  final int livesNumber;

  LivesHealthComponent({
    required this.livesNumber,
    required super.position,
    required super.size,
    super.scale,
    super.angle,
    super.anchor,
    super.priority,
  });

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    final availableSprite = await game.loadSprite(
      'lives.png',
      srcSize: Vector2.all(128),
    );

    final unavaibleSprite = await game.loadSprite(
      'died.png',
      srcSize: Vector2.all(512),
    );

    sprites = {
      LivesState.available: availableSprite,
      LivesState.unavailable: unavaibleSprite,
    };
    current = LivesState.available;
  }

  @override
  void update(double dt) {
    if (game.lives < livesNumber) {
      current = LivesState.unavailable;
    } else {
      current = LivesState.available;
    }
    super.update(dt);
  }
}
