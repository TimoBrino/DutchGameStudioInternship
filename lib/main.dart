import 'package:flame/game.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'run_and_jump.dart';

void main() {
  runApp(
    const GameWidget<RunAndJump>.controlled(
      gameFactory: RunAndJump.new,
    ),
  );
}
