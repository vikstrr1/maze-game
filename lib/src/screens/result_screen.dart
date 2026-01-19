import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResultScreen extends StatelessWidget {
  final int levelId;
  const ResultScreen({super.key, required this.levelId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle_outline, size: 100, color: Colors.green),
            const SizedBox(height: 20),
            Text('Level $levelId Complete!', 
              style: const TextStyle(fontSize: 32, color: Colors.white)),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () => Get.back(), // Navigates back to Level Selection
              child: const Text('Return to Level Select'),
            ),
          ],
        ),
      ),
    );
  }
}