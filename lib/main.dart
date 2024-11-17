import 'dart:async';

import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';
import 'package:maze_game/exit.dart';
import 'package:maze_game/player.dart';
import 'package:maze_game/wall.dart';

void main() {
  runApp(GameWidget(game: MyGame()));
}

class MyGame extends FlameGame
    with HasKeyboardHandlerComponents, HasCollisionDetection {
  @override
  Future<void> onLoad() async {
    add(Player());
    add(Wall(Vector2(100, 100), Vector2(200, 50)));
    add(Wall(Vector2(200, 200), Vector2(50, 200)));
    add(Wall(Vector2(150, 300), Vector2(200, 50)));
    add(Exit(Vector2(400, 400)));
  }
}
