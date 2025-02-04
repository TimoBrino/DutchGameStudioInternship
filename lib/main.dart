import 'package:flame/game.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  final game = FlameGame();
  runApp(GameWidget(game: game));
}