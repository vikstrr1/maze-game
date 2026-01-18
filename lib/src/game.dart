import 'package:flame/game.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'components/player.dart';
import 'components/maze_wall.dart';

class MazeGame extends FlameGame with HasCollisionDetection {
  final int levelId;
  MazeGame({required this.levelId});

  @override
  Future<void> onLoad() async {
    // Requirement: Responsive scaling
    camera = CameraComponent.withFixedResolution(width: 800, height: 600);
    
    // Add Player
    add(PlayerBall()..position = Vector2(50, 50));
    
    // Requirement: Three different levels
    _loadLevel(levelId);
    
    // Boundaries
    add(ScreenHitbox());
  }

  void _loadLevel(int id) {
    if (id == 1) {
      add(MazeWall(Vector2(200, 0), Vector2(20, 400)));
    } else if (id == 2) {
      add(MazeWall(Vector2(100, 100), Vector2(300, 20)));
      add(MazeWall(Vector2(400, 100), Vector2(20, 300)));
    } else {
      // Level 3 logic...
    }
  }
}