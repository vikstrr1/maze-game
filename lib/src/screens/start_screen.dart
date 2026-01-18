import 'package:flutter/material.dart';
import 'level_select_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const LevelSelectScreen())),
          child: const Text('Select Level'),
        ),
      ),
    );
  }
}