import 'package:flame/game.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'components/player.dart';
import 'components/maze_wall.dart';
import 'components/maze_exit.dart';
import 'models/maze_levels.dart'; // Import the new data file

class MazeGame extends FlameGame with HasCollisionDetection {
  final int levelId;
  late JoystickComponent joystick;

  MazeGame({required this.levelId});

  @override
  Future<void> onLoad() async {
    camera = CameraComponent.withFixedResolution(width: 800, height: 600);
    
    // 1. Get Level Data
    final levelData = mazeLevels[levelId] ?? mazeLevels[1]!;

    // 2. Setup Joystick
    joystick = JoystickComponent(
      knob: CircleComponent(radius: 20, paint: Paint()..color = Colors.white.withOpacity(0.5)),
      background: CircleComponent(radius: 50, paint: Paint()..color = Colors.white.withOpacity(0.2)),
      margin: const EdgeInsets.only(left: 40, bottom: 40),
    );
    camera.viewport.add(joystick);

    // 3. Add Player at start position
    final player = PlayerBall(joystick: joystick);
    player.position = levelData.startPosition;
    world.add(player);
    
    // 4. Load Maze Components
    _buildMaze(levelData);
    
    // Add world boundaries
    world.add(ScreenHitbox());
  }

  void _buildMaze(MazeLevelData data) {
    // Add the green exit goal
    world.add(MazeExit(position: data.exitPosition, levelId: levelId));

    // Add all walls defined in the layout
    for (var wall in data.walls) {
      world.add(MazeWall(wall['pos']!, wall['size']!));
    }
  }
}