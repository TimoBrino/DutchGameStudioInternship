import 'package:flame/game.dart';

class RunAndJump extends FlameGame {
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
  }
}
