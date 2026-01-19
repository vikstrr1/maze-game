import 'package:flame/components.dart';

class MazeLevelData {
  final Vector2 startPosition;
  final Vector2 exitPosition;
  final List<Map<String, Vector2>> walls;

  MazeLevelData({
    required this.startPosition,
    required this.exitPosition,
    required this.walls,
  });
}

final Map<int, MazeLevelData> mazeLevels = {
  1: MazeLevelData(
    startPosition: Vector2(50, 50),
    exitPosition: Vector2(750, 550),
    walls: [
      {'pos': Vector2(0, 150), 'size': Vector2(600, 20)},
      {'pos': Vector2(200, 300), 'size': Vector2(600, 20)},
      {'pos': Vector2(400, 150), 'size': Vector2(20, 150)},
    ],
  ),
  2: MazeLevelData(
    startPosition: Vector2(40, 40),
    exitPosition: Vector2(740, 500),
    walls: [
      {'pos': Vector2(150, 0), 'size': Vector2(20, 450)},
      {'pos': Vector2(150, 450), 'size': Vector2(450, 20)},
      {'pos': Vector2(350, 0), 'size': Vector2(20, 300)},
      {'pos': Vector2(350, 300), 'size': Vector2(300, 20)},
      {'pos': Vector2(600, 100), 'size': Vector2(20, 400)},
    ],
  ),
  3: MazeLevelData(
    // THE REAL MAZE: Complex layout with dead ends
    startPosition: Vector2(40, 40),
    exitPosition: Vector2(730, 70),
    walls: [
      {'pos': Vector2(100, 0), 'size': Vector2(20, 500)},
      {'pos': Vector2(100, 500), 'size': Vector2(600, 20)},
      {'pos': Vector2(200, 100), 'size': Vector2(500, 20)},
      {'pos': Vector2(200, 100), 'size': Vector2(20, 300)},
      {'pos': Vector2(300, 200), 'size': Vector2(20, 300)},
      {'pos': Vector2(300, 200), 'size': Vector2(300, 20)},
      {'pos': Vector2(400, 300), 'size': Vector2(20, 200)},
      {'pos': Vector2(500, 100), 'size': Vector2(20, 300)},
      {'pos': Vector2(600, 200), 'size': Vector2(20, 300)},
      {'pos': Vector2(700, 0), 'size': Vector2(20, 400)},
    ],
  ),
};