import 'package:flame/components.dart';
import 'package:flame/collisions.dart';
import 'package:flutter/material.dart';

class MazeWall extends RectangleComponent {
  MazeWall(Vector2 pos, Vector2 size) 
    : super(position: pos, size: size, paint: Paint()..color = Colors.grey);

  @override
  Future<void> onLoad() async {
    add(RectangleHitbox()); // Walls must stop the player
  }
}