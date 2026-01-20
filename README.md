# Project Submission: Maze Game

This is my 2D maze navigation game built using the **Flutter** framework and the **Flame** game engine. The core experience focuses on precision movement and pathfinding through a series of increasingly difficult, handcrafted labyrinths.

### 1. Game Idea and Purpose
The game is a classic maze-runner where the player must navigate a blue ball to a green exit point. To ensure the purpose is clear to the user, I added an instruction section on the **Start Screen** explaining exactly how to play and what the goal is.

### 2. Screens and Navigation
The application features a complete user flow across four distinct screens:
* **Start Screen**: The entry point with game instructions.
* **Level Selection Screen**: A grid displaying available levels and their locked/unlocked status.
* **Game Screen**: The active Flame engine world where gameplay takes place.
* **Result Screen**: A celebration screen triggered upon reaching the goal.
* I utilized the **GetX** package for all transitions (`Get.to`, `Get.off`, `Get.back`) to ensure a smooth, intuitive, and modern user experience.

### 3. Responsiveness and Layout
* **Breakpoints**: The Level Selection screen is fully responsive. I implemented a breakpoint that switches the layout from **3 columns** on desktop/tablets to **2 columns** on smaller mobile devices.
* **Content Limiting**: To prevent the UI from becoming unreadable on ultra-wide monitors, I used `ConstrainedBox` to set a **maximum width of 800px** for the menu content.
* **Game Scaling**: For the game itself, I used Flame's `CameraComponent.withFixedResolution(width: 800, height: 600)`. This ensures that the maze geometry and difficulty remain consistent regardless of the physical screen size.

### 4. Level Design
I have included **4 levels**, each defined in a dedicated `maze_levels.dart` file. They are designed as actual mazes with:
* Interlocking vertical and horizontal walls.
* Intentional dead ends and "L-shaped" pockets.
* Unique start and exit coordinates for every stage.

### 5. Persistent Progression
I integrated the game with **Firebase Firestore**. 
* When a player completes a level, their progress is instantly saved to their user document in the cloud.
* Upon restarting the application or refreshing the browser, the game fetches this data so that previously cleared levels remain unlocked.

### 6. Touch and Mobile Compatibility
The game is built to be "mobile-first."
* Movement is controlled via a virtual **JoystickComponent**.
* All menu interactions use large, tap-friendly buttons.
* No keyboard or mouse is required to play the game from start to finish.

### 7. Deployment
The application has been compiled for the web and deployed using **Firebase Hosting**. The live link is shared below.

---

## Live Game Link
You can play the game online here:  
https://maze-game-abc123.web.app/