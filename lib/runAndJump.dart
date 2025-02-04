import 'package:dutch_game_studio_game/actors/player.dart';
import 'package:dutch_game_studio_game/actors/slime.dart';
import 'package:dutch_game_studio_game/objects/ground.dart';
import 'package:dutch_game_studio_game/objects/platform.dart';
import 'package:dutch_game_studio_game/managers/segmentManager.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class RunAndJump extends FlameGame with HasKeyboardHandlerComponents{
  late Player _player;
  double objectSpeed = 0.0;

  @override
  Future<void> onLoad() async {
    await images.loadAll([
      'dudeMonsterIdle.png',
      'dudeMonsterRun.png',
      'dudeMonsterJump.png',
      'blueSlimeWalk.png',
      'greenSlimeWalk.png',
      'platform.png',
      'ground.png',
    ]);

    camera.viewfinder.anchor = Anchor.topLeft;
    initializeGame();

    _player = Player(
      position: Vector2(128, canvasSize.y - 70),
    );
    world.add(_player);
  }

  void loadGameSegments(int segmentIndex, double xPositionOffset) {
    for (final block in segments[segmentIndex]) {
      switch (block.blockType) {
        case Ground:
          add(
            Ground(
              gridPosition: block.gridPosition,
              xOffset: xPositionOffset,
            ),
          );
        case Platform:
          add(
            Platform(
              gridPosition: block.gridPosition,
              xOffset: xPositionOffset,
            ),
          );
        case Slime:
          world.add(
            Slime(
              gridPosition: block.gridPosition,
              xOffset: xPositionOffset,
            ),
          );
      }
    }
  }

  void initializeGame() {
    final segmentsToLoad = (size.x / 640).ceil();
    segmentsToLoad.clamp(0, segments.length);
    for (var i = 0; i < segmentsToLoad; i++) {
      loadGameSegments(i, (640 * i).toDouble());
    }
  }

  @override
  Color backgroundColor() {
    return const Color.fromARGB(255, 173, 223, 247);
  }
}
