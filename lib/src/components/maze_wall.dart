import 'package:flame/components.dart';
import 'package:flame/collisions.dart';
import 'package:flutter/material.dart';

class MazeWall extends RectangleComponent with CollisionCallbacks {
  MazeWall(Vector2 position, Vector2 size)
      : super(
          position: position,
          size: size,
          paint: Paint()..color = Colors.white,
        );

  @override
  Future<void> onLoad() async {
    // FIX: Set to passive for better performance and reliability
    add(RectangleHitbox()..collisionType = CollisionType.passive);
  }
}