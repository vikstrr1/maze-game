import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Import your generated Firebase options
import 'firebase_options.dart';

// Import your custom controllers and screens
import 'src/controllers/user_controller.dart';
import 'src/controllers/game_controller.dart';
import 'src/screens/login_screen.dart';
import 'src/screens/start_screen.dart';

void main() async {
  // Ensure Flutter bindings are initialized before Firebase
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Firebase with the platform-specific options
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Use GetX to inject controllers so they are available throughout the app
  Get.lazyPut<UserController>(() => UserController());
  Get.lazyPut<GameController>(() => GameController());

  runApp(const MazeApp());
}

class MazeApp extends StatelessWidget {
  const MazeApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Access the UserController to monitor login state
    final userController = Get.find<UserController>();

    // GetMaterialApp is required for GetX navigation and state management
    return GetMaterialApp(
      title: 'Maze Explorer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      // Requirement: Switch screens based on authentication status
      home: Obx(
        () {
          if (userController.user.value == null) {
            return LoginScreen();
          } else {
            return const StartScreen();
          }
        },
      ),
    );
  }
}