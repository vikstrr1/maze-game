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
      backgroundColor: Colors.blueGrey[900], 
      appBar: AppBar(
        title: const Text('MAZE SELECTION'),
        backgroundColor: Colors.white54,
        elevation: 0,
      ),
      body: Center(
        child: ConstrainedBox(
          // Project Requirement: Max width to limit content on high-res devices
          constraints: const BoxConstraints(maxWidth: 800), 
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Obx(() {
              // Access current progression from Firebase via GetX controller
              final currentUnlocked = gameController.unlockedLevel.value;

              return GridView.builder(
                shrinkWrap: true,
                // Project Requirement: Breakpoint influencing layout
                // 3 columns on wide screens, 2 on narrow phones
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: context.width > 500 ? 3 : 2, 
                  crossAxisSpacing: 25,
                  mainAxisSpacing: 25,
                  childAspectRatio: 1.1,
                ),
                // We have increased this to 4 to support your new harder level
                itemCount: 4, 
                itemBuilder: (context, index) {
                  int levelNumber = index + 1;
                  bool isUnlocked = levelNumber <= currentUnlocked;

                  return InkWell(
                    onTap: isUnlocked 
                      ? () => Get.to(() => GameScreen(levelId: levelNumber))
                      : null,
                    child: Container(
                      decoration: BoxDecoration(
                        color: isUnlocked ? Colors.blueAccent : Colors.grey[800],
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: isUnlocked ? [
                          BoxShadow(
                            color: Colors.blue.withValues(alpha:0.4),
                            blurRadius: 10,
                            spreadRadius: 2,
                          )
                        ] : [],
                        border: Border.all(
                          color: isUnlocked ? Colors.white : Colors.white24,
                          width: 2,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            isUnlocked ? Icons.play_circle_fill : Icons.lock,
                            size: 40,
                            color: Colors.white,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'LEVEL $levelNumber',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          if (!isUnlocked)
                            const Text(
                              'LOCKED',
                              style: TextStyle(color: Colors.white54, fontSize: 12),
                            ),
                        ],
                      ),
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