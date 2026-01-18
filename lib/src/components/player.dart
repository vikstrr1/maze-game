import 'package:flame/components.dart';
import 'package:flame/collisions.dart';
import 'package:flutter/material.dart';

class PlayerBall extends CircleComponent with CollisionCallbacks {
  PlayerBall() : super(radius: 15, paint: Paint()..color = Colors.blue);

  @override
  Future<void> onLoad() async {
    add(CircleHitbox()); // Collision requirement
  }
}