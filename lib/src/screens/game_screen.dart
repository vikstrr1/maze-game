import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import '../game.dart';

class GameScreen extends StatelessWidget {
  final int levelId;

  const GameScreen({super.key, required this.levelId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // The GameWidget is the bridge between Flutter and Flame
      body: Stack(
        children: [
          GameWidget(
            game: MazeGame(levelId: levelId),
            loadingBuilder: (context) => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
          // Navigation: Intuitive back button overlay
          Positioned(
            top: 40,
            left: 20,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white, size: 30),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
        ],
      ),
    );
  }
}