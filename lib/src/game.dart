import 'package:flame/game.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'components/player.dart';
import 'components/maze_wall.dart';
import 'components/maze_exit.dart';

class MazeGame extends FlameGame with HasCollisionDetection {
  final int levelId;
  late JoystickComponent joystick; // Track joystick instance

  MazeGame({required this.levelId});

  @override
  Future<void> onLoad() async {
    camera = CameraComponent.withFixedResolution(width: 800, height: 600);
    
    // Create the virtual joystick for touch input
    joystick = JoystickComponent(
      knob: CircleComponent(radius: 20, paint: Paint()..color = Colors.white.withOpacity(0.5)),
      background: CircleComponent(radius: 50, paint: Paint()..color = Colors.white.withOpacity(0.2)),
      margin: const EdgeInsets.only(left: 40, bottom: 40),
    );
    add(joystick);

    // FIX: Pass the required joystick argument to PlayerBall
    add(PlayerBall(joystick: joystick)..position = Vector2(50, 50));
    
    _loadLevel(levelId);
    
    add(ScreenHitbox());
  }

  void _loadLevel(int id) {
    if (id == 1) {
      add(MazeWall(Vector2(200, 0), Vector2(20, 400)));
      add(MazeExit(position: Vector2(700, 500), levelId: 1));
    } else if (id == 2) {
      add(MazeWall(Vector2(100, 100), Vector2(300, 20)));
      add(MazeWall(Vector2(400, 100), Vector2(20, 300)));
      add(MazeExit(position: Vector2(700, 100), levelId: 2));
    } else if (id == 3) {
      add(MazeWall(Vector2(0, 300), Vector2(600, 20)));
      add(MazeExit(position: Vector2(50, 500), levelId: 3));
    }
  }
}