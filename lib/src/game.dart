import 'package:flame/game.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'components/player.dart';
import 'components/maze_wall.dart';
import 'components/maze_exit.dart';
import 'components/maze_border.dart';
import 'models/maze_levels.dart';

class MazeGame extends FlameGame with HasCollisionDetection {
  final int levelId;
  late JoystickComponent joystick;

  MazeGame({required this.levelId});

  @override
  Future<void> onLoad() async {
    camera = CameraComponent.withFixedResolution(width: 800, height: 600);
    
    final data = mazeLevels[levelId] ?? mazeLevels[1]!;


    joystick = JoystickComponent(
      knob: CircleComponent(radius: 20, paint: Paint()..color = Colors.white.withOpacity(0.5)),
      background: CircleComponent(radius: 50, paint: Paint()..color = Colors.white.withOpacity(0.2)),
      margin: const EdgeInsets.only(left: 40, bottom: 40),
    );
    camera.viewport.add(joystick);


    world.add(MazeBorder());


    world.add(MazeExit(position: data.exitPosition, levelId: levelId));
    

    for (var wall in data.walls) {
      world.add(MazeWall(wall['pos']!, wall['size']!));
    }


    final player = PlayerBall(joystick: joystick);
    player.position = data.startPosition;
    world.add(player);
    

    world.add(ScreenHitbox());
  }
}