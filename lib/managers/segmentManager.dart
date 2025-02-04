import 'package:dutch_game_studio_game/objects/ground.dart';
import 'package:dutch_game_studio_game/objects/platform.dart';
import 'package:dutch_game_studio_game/actors/slime.dart';
import 'package:flame/game.dart';

class Block {
  final Vector2 gridPosition;
  final Type blockType;
  Block(this.gridPosition, this.blockType);
}

final segments = [
  segment0,
  segment1,
];

final segment0 = [
  Block(Vector2(0, 0), Ground),
  Block(Vector2(1, 0), Ground),
  Block(Vector2(2, 0), Ground),
  Block(Vector2(3, 0), Ground),
  Block(Vector2(4, 0), Ground),
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

final segment1 = [

];