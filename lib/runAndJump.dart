import 'package:dutch_game_studio_game/Actors/player.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';

class RunAndJump extends FlameGame {
  late Player _player;
  RunAndJump();

  @override
  Future<void> onLoad() async {
    await images.loadAll([
      'dudeMonsterIdle.png',
      'dudeMonsterRun.png',
      'dudeMonsterJump.png',
      'blueSlimeWalk.png',
      'greenSlimeWalk.png',
      'natureEnviroment.png',
    ]);

    camera.viewfinder.anchor = Anchor.topLeft;

    _player = Player(
      position: Vector2(128, canvasSize.y - 70),
    );
    world.add(_player);
  }
}
