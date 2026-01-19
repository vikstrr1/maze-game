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
    startPosition: Vector2(-350, -250),
    exitPosition: Vector2(350, 250),
    walls: [
      {'pos': Vector2(0, -300), 'size': Vector2(20, 500)}, // Middle wall with gap at bottom
    ],
  ),
  2: MazeLevelData(
    startPosition: Vector2(-350, -250),
    exitPosition: Vector2(350, 250),
    walls: [
      {'pos': Vector2(-150, -300), 'size': Vector2(20, 450)},
      {'pos': Vector2(150, -150), 'size': Vector2(20, 450)},
    ],
  ),
  3: MazeLevelData(
    // THE SOLVABLE FULL-SCREEN MAZE
    startPosition: Vector2(-350, -250), // Start Top-Left
    exitPosition: Vector2(350, 250),    // Exit Bottom-Right
    walls: [
      // Wall 1: Gap at the bottom (-300 to 150, leaving 150px gap)
      {'pos': Vector2(-250, -300), 'size': Vector2(20, 450)}, 
      
      // Wall 2: Gap at the top (-150 to 300, leaving 150px gap)
      {'pos': Vector2(-100, -150), 'size': Vector2(20, 450)}, 
      
      // Wall 3: Gap at the bottom
      {'pos': Vector2(50, -300), 'size': Vector2(20, 450)},
      
      // Wall 4: Gap at the top
      {'pos': Vector2(200, -150), 'size': Vector2(20, 450)},
    ],
  ),
};