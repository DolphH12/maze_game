import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maze_game/exit.dart';
import 'package:maze_game/main.dart';
import 'package:maze_game/wall.dart';

class Player extends PositionComponent
    with KeyboardHandler, HasGameRef<MyGame>, CollisionCallbacks {
  Vector2 movement = Vector2.zero();
  Vector2 velocity = Vector2.zero();
  Vector2 previusPosition = Vector2.zero();

  @override
  FutureOr<void> onLoad() {
    size = Vector2(50, 50);
    position = Vector2(50, 50);
    add(RectangleHitbox());
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    final paint = Paint()..color = Colors.blue;
    canvas.drawRect(size.toRect(), paint);
  }

  @override
  bool onKeyEvent(KeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    movement = Vector2.zero();
    if (keysPressed.contains(LogicalKeyboardKey.arrowUp)) movement.y = -1;
    if (keysPressed.contains(LogicalKeyboardKey.arrowDown)) movement.y = 1;
    if (keysPressed.contains(LogicalKeyboardKey.arrowLeft)) movement.x = -1;
    if (keysPressed.contains(LogicalKeyboardKey.arrowRight)) movement.x = 1;
    return super.onKeyEvent(event, keysPressed);
  }

  @override
  void update(double dt) {
    super.update(dt);
    velocity = movement * 100;
    previusPosition = position.clone();
    position += velocity * dt;

    position.clamp(
      Vector2.zero(),
      Vector2(game.size.x - size.x, game.size.y - size.y),
    );
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    if (other is Wall) {
      position = previusPosition;
      movement = Vector2.zero();
    }
    if (other is Exit) {
      debugPrint('Has Ganado!');
    }
  }
}
