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
    // Level 1: Connected "C" Path with a pocket finish
    startPosition: Vector2(-350, -250),
    // GOAL POSITION: Tucked into the corner of the L-shape
    exitPosition: Vector2(150, 50), 
    walls: [
      {'pos': Vector2(-200, -300), 'size': Vector2(20, 500)}, 
      {'pos': Vector2(-200, 200), 'size': Vector2(420, 20)}, 
      {'pos': Vector2(200, -100), 'size': Vector2(20, 320)}, 
      {'pos': Vector2(70, -100), 'size': Vector2(150, 20)},
    ],
  ),
  2: MazeLevelData(
    startPosition: Vector2(-350, -250),
    exitPosition: Vector2(0, 0),
    walls: [
      {'pos': Vector2(-400, 100), 'size': Vector2(600, 20)}, // Bottom floor
      {'pos': Vector2(200, -200), 'size': Vector2(20, 300)}, // Right wall
      {'pos': Vector2(-100, -200), 'size': Vector2(300, 20)}, // Top ceiling
      {'pos': Vector2(-100, -200), 'size': Vector2(20, 200)}, // Left inner wall
    ],
  ),
  3: MazeLevelData(
    // Level 3: The "Snake" (Start Bottom-Left, Exit Top-Right)
    startPosition: Vector2(-350, 250),
    exitPosition: Vector2(350, -250),
    walls: [
      {'pos': Vector2(-250, -100), 'size': Vector2(20, 400)}, // Gap at top
      {'pos': Vector2(-100, -300), 'size': Vector2(20, 400)}, // Gap at bottom
      {'pos': Vector2(50, -100), 'size': Vector2(20, 400)},  // Gap at top
      {'pos': Vector2(200, -300), 'size': Vector2(20, 400)}, // Gap at bottom
    ],
  ),
  4: MazeLevelData(
    // Level 4: The "Labyrinth" (True Maze Logic)
    // Start Center-Left, Exit Bottom-Right
    startPosition: Vector2(-350, 0),
    exitPosition: Vector2(350, 250),
    walls: [
      // Main Vertical Ribs
      {'pos': Vector2(-250, -300), 'size': Vector2(20, 250)},
      {'pos': Vector2(-250, 50), 'size': Vector2(20, 250)},
      {'pos': Vector2(-50, -150), 'size': Vector2(20, 300)},
      {'pos': Vector2(150, -300), 'size': Vector2(20, 210)},
      {'pos': Vector2(150, -30), 'size': Vector2(20, 350)},
      // Interlocking Horizontal Blocks
      {'pos': Vector2(-250, -50), 'size': Vector2(200, 20)},
      {'pos': Vector2(-50, 150), 'size': Vector2(160, 20)},
      {'pos': Vector2(150, -50), 'size': Vector2(200, 20)},
    ],
  ),
};