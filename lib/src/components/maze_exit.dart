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
        size: Vector2(60, 60), 
        paint: Paint()..color = Colors.green,
      );

  @override
  Future<void> onLoad() async {
    add(RectangleHitbox());
  }

  @override
  void onCollisionStart(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);
    if (other is PlayerBall) {
      Get.find<GameController>().completeLevel(levelId);
      Get.off(() => ResultScreen(levelId: levelId));
    }
  }
}