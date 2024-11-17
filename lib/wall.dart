import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class Wall extends PositionComponent with CollisionCallbacks {
  Wall(Vector2 position, Vector2 size) : super(position: position, size: size);

  @override
  FutureOr<void> onLoad() {
    add(RectangleHitbox());
    return super.onLoad();
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    final paint = Paint()..color = Colors.brown;
    canvas.drawRect(size.toRect(), paint);
  }
}
