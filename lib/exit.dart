import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class Exit extends PositionComponent with CollisionCallbacks {
  Exit(Vector2 position) : super(position: position, size: Vector2(50, 50));

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    final paint = Paint()..color = Colors.green;
    canvas.drawRect(size.toRect(), paint);
  }

  @override
  FutureOr<void> onLoad() {
    add(RectangleHitbox());
    return super.onLoad();
  }
}
