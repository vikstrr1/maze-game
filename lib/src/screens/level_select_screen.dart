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
          // Requirement: Maximum width for high resolution
          constraints: const BoxConstraints(maxWidth: 600),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Obx(() => GridView.builder(
              shrinkWrap: true,
              // Requirement: Responsive layout (breakpoint logic can be added here)
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
              itemCount: 3, // Requirement: At least three levels
              itemBuilder: (context, index) {
                int levelNumber = index + 1;
                bool isUnlocked = levelNumber <= gameController.unlockedLevel.value;

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
                    : null, // Button is disabled if level is locked
                  child: Text(
                    isUnlocked ? '$levelNumber' : 'Locked',
                    style: const TextStyle(color: Colors.white),
                  ),
                );
              },
            )),
          ),
        ),
      ),
    );
  }
}