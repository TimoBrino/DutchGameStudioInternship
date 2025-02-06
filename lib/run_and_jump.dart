import 'package:dutch_game_studio_game/objects/door.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;

import 'package:dutch_game_studio_game/actors/player.dart';
import 'package:dutch_game_studio_game/actors/slime.dart';
import 'package:dutch_game_studio_game/objects/ground.dart';
import 'package:dutch_game_studio_game/objects/platform.dart';
import 'package:dutch_game_studio_game/managers/segment_manager.dart';
import 'package:dutch_game_studio_game/overlays/hud.dart';

class RunAndJump extends FlameGame
    with HasCollisionDetection, HasKeyboardHandlerComponents {
  late Player _player;
  double objectSpeed = 0.0;
  int lives = 3;

  @override
  Future<void> onLoad() async {
    await images.loadAll([
      'dudeMonsterIdle.png',
      'dudeMonsterRun.png',
      'dudeMonsterJump.png',
      'blueSlimeWalk.png',
      'greenSlimeWalk.png',
      'lives.png',
      'died.png',
      'platform.png',
      'ground.png',
      'door.png',
    ]);

    await FlameAudio.audioCache.loadAll([
      'bgMusic.mp3',
    ]);

    FlameAudio.bgm.initialize();

    camera.viewfinder.anchor = Anchor.topLeft;
    initializeGame();
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
        case Door:
          add(
            Door(gridPosition: block.gridPosition, xOffset: xPositionOffset),
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
    _player = Player(
      position: Vector2(128, canvasSize.y - 128),
    );
    world.add(_player);
    camera.viewport.add(Hud());
    // FlameAudio.bgm.play('bgMusic.mp3', volume: 0.1);
  }

  @override
  Color backgroundColor() {
    return const Color.fromARGB(255, 173, 223, 247);
  }

  @override
  void update(double dt) {
    if (lives <= 0) {
      html.window.location.reload();
    }
    super.update(dt);
  }
}
