import 'package:flame/game.dart';

import 'package:dutch_game_studio_game/objects/ground.dart';
import 'package:dutch_game_studio_game/objects/platform.dart';
import 'package:dutch_game_studio_game/actors/slime.dart';

class Block {
  final Vector2 gridPosition;
  final Type blockType;
  Block(this.gridPosition, this.blockType);
}

final segments = [
  segment0,
  segment1,
  segment2,
  segment3,
];

final segment0 = [
  Block(Vector2(0, 0), Ground),
  Block(Vector2(1, 0), Ground),
  Block(Vector2(2, 0), Ground),
  Block(Vector2(3, 0), Ground),
  Block(Vector2(4, 0), Ground),
  Block(Vector2(5, 0), Ground),
  Block(Vector2(5, 1), Platform),
  Block(Vector2(6, 0), Ground),
  Block(Vector2(6, 1), Platform),
  Block(Vector2(6, 2), Platform),
  Block(Vector2(7, 0), Ground),
  Block(Vector2(8, 0), Ground),
  Block(Vector2(9, 0), Ground),
];

final segment1 = [
  Block(Vector2(0, 0), Ground),
  Block(Vector2(0, 1), Slime),
  Block(Vector2(1, 0), Ground),
  Block(Vector2(2, 2), Platform),
  Block(Vector2(3, 2), Platform),
  Block(Vector2(4, 0), Ground),
  Block(Vector2(5, 0), Ground),
  Block(Vector2(6, 0), Ground),
  Block(Vector2(7, 0), Ground),
  Block(Vector2(7, 1), Slime),
  Block(Vector2(8, 0), Ground),
  Block(Vector2(9, 0), Ground),
];

final segment2 = [
  Block(Vector2(1, 1), Platform),
  Block(Vector2(2, 0), Ground),
  Block(Vector2(3, 0), Ground),
  Block(Vector2(3, 2), Platform),
  Block(Vector2(4, 0), Ground),
  Block(Vector2(5, 0), Ground),
  Block(Vector2(5, 3), Platform),
  Block(Vector2(6, 0), Ground),
  Block(Vector2(6, 3), Platform),
  Block(Vector2(7, 0), Ground),
  Block(Vector2(7, 3), Platform),
  Block(Vector2(7, 4), Slime),
  Block(Vector2(8, 3), Platform),
];

final segment3 = [
  Block(Vector2(3, 3), Platform),
  Block(Vector2(5, 0), Ground),
  Block(Vector2(5, 3), Platform),
  Block(Vector2(6, 0), Ground),
  Block(Vector2(6, 3), Platform),
  Block(Vector2(7, 0), Ground),
  Block(Vector2(7, 3), Platform),
  Block(Vector2(7, 4), Slime),
  Block(Vector2(8, 0), Ground),
  Block(Vector2(9, 0), Ground),
];