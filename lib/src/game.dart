import 'package:flame/game.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'components/player.dart';
import 'components/maze_wall.dart';
import 'components/maze_exit.dart';
import 'models/maze_levels.dart';

class MazeGame extends FlameGame with HasCollisionDetection {
  final int levelId;
  late JoystickComponent joystick;

  MazeGame({required this.levelId});

  @override
  Future<void> onLoad() async {
    // 1. Force the resolution to 800x600 (Center is 0,0)
    camera = CameraComponent.withFixedResolution(width: 800, height: 600);
    
    final data = mazeLevels[levelId] ?? mazeLevels[1]!;

    // 2. HUD: Joystick
    joystick = JoystickComponent(
      knob: CircleComponent(radius: 20, paint: Paint()..color = Colors.white.withOpacity(0.5)),
      background: CircleComponent(radius: 50, paint: Paint()..color = Colors.white.withOpacity(0.2)),
      margin: const EdgeInsets.only(left: 40, bottom: 40),
    );
    camera.viewport.add(joystick);

    // 3. World: Goal (Added first so it's "behind" the player)
    world.add(MazeExit(position: data.exitPosition, levelId: levelId));
    
    // 4. World: Walls
    for (var wall in data.walls) {
      world.add(MazeWall(wall['pos']!, wall['size']!));
    }

    // 5. World: Player
    final player = PlayerBall(joystick: joystick);
    player.position = data.startPosition;
    world.add(player);
    
    // 6. World: Boundaries (Keeps player within the 800x600 view)
    world.add(ScreenHitbox());
  }
}