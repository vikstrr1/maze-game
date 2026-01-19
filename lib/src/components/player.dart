import 'package:flame/components.dart';
import 'package:flame/collisions.dart';
import 'package:flutter/material.dart';
import 'maze_wall.dart';

class PlayerBall extends PositionComponent with CollisionCallbacks {
  final JoystickComponent joystick;
  final Paint _paint = Paint()..color = Colors.blue;
  
  // Store the position from the previous frame to "undo" movement on hit
  Vector2 _lastPosition = Vector2.zero();

  PlayerBall({required this.joystick}) : super(
    size: Vector2.all(30), 
    anchor: Anchor.center,
  );

  @override
  Future<void> onLoad() async {
    add(CircleHitbox(radius: 15, anchor: Anchor.center, position: Vector2(15, 15)));
    _lastPosition = position.clone();
  }

  @override
  void update(double dt) {
    super.update(dt);
    // Remember current position before moving
    _lastPosition = position.clone();

    if (!joystick.delta.isZero()) {
      position.add(joystick.relativeDelta * 300 * dt);
    }
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    canvas.drawCircle(const Offset(15, 15), 15, _paint);
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    
    // FIX: If we hit a wall or the screen edge, reset to the safe position
    if (other is MazeWall || other is ScreenHitbox) {
      position = _lastPosition; 
    }
  }
}