import 'package:flame/game.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'components/player.dart';
import 'components/maze_wall.dart';
import 'components/maze_exit.dart';

class MazeGame extends FlameGame with HasCollisionDetection {
  final int levelId;
  late JoystickComponent joystick;

  MazeGame({required this.levelId});

  @override
  Future<void> onLoad() async {
    camera = CameraComponent.withFixedResolution(width: 800, height: 600);
    
    // HUD Layer
    joystick = JoystickComponent(
      knob: CircleComponent(radius: 20, paint: Paint()..color = Colors.white.withOpacity(0.5)),
      background: CircleComponent(radius: 50, paint: Paint()..color = Colors.white.withOpacity(0.2)),
      margin: const EdgeInsets.only(left: 40, bottom: 40),
    );
    camera.viewport.add(joystick);

    // World Layer
    final player = PlayerBall(joystick: joystick);
    player.position = Vector2(100, 100);
    world.add(player);
    
    _loadLevel(levelId);
    
    // FIX: Add boundaries to the world so player stays within resolution
    world.add(ScreenHitbox());
  }

  void _loadLevel(int id) {
    if (id == 1) {
      world.add(MazeWall(Vector2(300, 0), Vector2(20, 400)));
      world.add(MazeExit(position: Vector2(700, 500), levelId: 1));
    } else if (id == 2) {
      world.add(MazeWall(Vector2(100, 200), Vector2(400, 20)));
      world.add(MazeExit(position: Vector2(700, 100), levelId: 2));
    } else {
      world.add(MazeWall(Vector2(0, 300), Vector2(600, 20)));
      world.add(MazeWall(Vector2(400, 0), Vector2(20, 300)));
      world.add(MazeExit(position: Vector2(100, 500), levelId: 3));
    }
  }
}