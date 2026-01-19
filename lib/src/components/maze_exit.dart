import 'package:flame/components.dart';
import 'package:flame/collisions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/game_controller.dart';
import '../screens/result_screen.dart';
import 'player.dart';

class MazeExit extends RectangleComponent with CollisionCallbacks {
  final int levelId;

  MazeExit({required Vector2 position, required this.levelId})
      : super(
          position: position,
          size: Vector2(50, 50),
          paint: Paint()..color = Colors.green,
        );

  @override
  Future<void> onLoad() async {
    add(RectangleHitbox()); // Requirement: Collision detection
  }

  @override
  void onCollisionStart(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);
    if (other is PlayerBall) {
      // Requirement: Save progression in Firebase
      Get.find<GameController>().completeLevel(levelId);

      // Requirement: Intuitive navigation to Result Screen
      Get.to(() => ResultScreen(levelId: levelId));
    }
  }
}