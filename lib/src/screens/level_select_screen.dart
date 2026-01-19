import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/game_controller.dart';
import 'game_screen.dart';

class LevelSelectScreen extends StatelessWidget {
  const LevelSelectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final gameController = Get.find<GameController>();

    return Scaffold(
      appBar: AppBar(title: const Text('Select Level')),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Obx(() {
              // FIX: Access .value inside Obx so GetX tracks it
              final currentUnlocked = gameController.unlockedLevel.value;

              return GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemCount: 3,
                itemBuilder: (context, index) {
                  int levelNumber = index + 1;
                  bool isUnlocked = levelNumber <= currentUnlocked;

                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isUnlocked ? Colors.blue : Colors.grey,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    onPressed: isUnlocked 
                      ? () => Navigator.push(
                          context, 
                          MaterialPageRoute(builder: (context) => GameScreen(levelId: levelNumber))
                        )
                      : null,
                    child: Text(
                      isUnlocked ? '$levelNumber' : 'Locked',
                      style: const TextStyle(color: Colors.white),
                    ),
                  );
                },
              );
            }),
          ),
        ),
      ),
    );
  }
}