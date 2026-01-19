import 'package:flame/components.dart';
import 'package:flame/collisions.dart';
import 'package:flutter/material.dart';

// We change 'CircleComponent' to 'PositionComponent' to avoid the '_centerOffset' bug
class PlayerBall extends PositionComponent with CollisionCallbacks {
  final JoystickComponent joystick;
  final Paint _paint = Paint()..color = Colors.blue;

  PlayerBall({required this.joystick}) : super(
    // We set an explicit size for the component 'box'
    size: Vector2.all(30), 
    anchor: Anchor.center,
  );

  @override
  Future<void> onLoad() async {
    // We add a CircleHitbox relative to our 30x30 size
    add(CircleHitbox(
      radius: 15, 
      anchor: Anchor.center, 
      position: Vector2(15, 15),
    ));
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    // We manually draw the circle. This cannot throw the '_centerOffset' error.
    canvas.drawCircle(const Offset(15, 15), 15, _paint);
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (!joystick.delta.isZero()) {
      position.add(joystick.relativeDelta * 300 * dt);
    }
  }
}