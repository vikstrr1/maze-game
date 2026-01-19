import 'package:flame/components.dart';
import 'package:flame/collisions.dart';
import 'package:flutter/material.dart';

class PlayerBall extends CircleComponent with CollisionCallbacks {
  final JoystickComponent joystick;
  
  PlayerBall({required this.joystick}) 
      : super(radius: 15, paint: Paint()..color = Colors.blue);

  @override
  Future<void> onLoad() async {
    add(CircleHitbox()); // Requirement: Collision logic
  }

  @override
  void update(double dt) {
    super.update(dt);
    // Requirement: Playable on touchscreen device
    if (!joystick.delta.isZero()) {
      position.add(joystick.relativeDelta * 300 * dt);
    }
  }
}