import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../game.dart';

class GameScreen extends StatelessWidget {
  final int levelId;
  const GameScreen({super.key, required this.levelId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Level $levelId'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: GameWidget(
        game: MazeGame(levelId: levelId),
      ),
    );
  }
}