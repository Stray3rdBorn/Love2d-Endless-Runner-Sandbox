# Endless Jumper Sandbox

A simple endless side-scrolling jumper game built with **LÖVE2D** (Love2D).

The player stays on the left side of the screen and must jump over a blue enemy square that keeps coming from the right. The enemy gradually gets faster the longer you survive. When you get hit, the game shows a Game Over screen. You can restart immediately.

This project is intentionally kept very small and easy to read so it can be used as a learning sandbox.

---

## Features

- Start screen with instructions
- Simple physics: gravity + jump
- One looping enemy that increases speed over time
- AABB (Axis-Aligned Bounding Box) collision detection
- Game Over screen
- Instant restart that resets player and enemy
- Clean game-state system (`startscreen` → `play` → `gameover`)

---

## Controls

| Key          | Action                          |
|--------------|---------------------------------|
| **Enter**    | Start the game / Restart after Game Over |
| **Space**    | Jump (only when on the ground)  |

---

## Requirements

- [LÖVE 11.4 or newer](https://love2d.org/) (recommended)
- Any operating system that LÖVE supports (Windows, macOS, Linux)

No extra libraries are required. Everything is written in pure Lua + the LÖVE API.

---

## How to Run

1. Install LÖVE from https://love2d.org/
2. Download or clone this repository
3. Drag the folder that contains `main.lua` onto the LÖVE executable  
   **or** open a terminal in the project folder and run:

```bash
love .
```

---

## Project Structure

```
.
├── main.lua                 # All game code (single file)
├── README.md                # This file
└── .github/
    └── workflows/
        └── ci.yml           # Continuous Integration workflow
```

The entire game currently lives in one file (`main.lua`) to keep things simple while learning.

---

## How the Code Works (Quick Overview)

### Game States
The game uses a simple string variable called `gameState`:

- `"startscreen"` → black screen with green/magenta text
- `"play"`        → normal gameplay
- `"gameover"`    → black screen with red “Game Over” text

### Player
- Red rectangle (25×30)
- Only moves on the Y axis (jumping)
- Gravity is applied only while jumping
- Lands and stops when `y` reaches 290

### Enemy
- Blue rectangle (25×30)
- Starts at the right edge (`x = 800`)
- Moves left every frame
- Speed slowly increases (`+10` per second)
- When it goes completely off the left side it teleports back to `x = 800`

### Collision
Uses classic AABB (four simple comparisons):

```lua
if player.x < enemy.x + 25 and
   player.x + 25 > enemy.x and
   player.y < enemy.y + 30 and
   player.y + 30 > enemy.y then
    gameState = "gameover"
end
```

This is the fastest and simplest method for two non-rotating rectangles.

### Restart
When you press Enter on the Game Over screen the code:
1. Sets `gameState` back to `"play"`
2. Resets player position and velocity
3. Resets enemy position and speed

---

## Future Ideas (not implemented yet)

- Multiple enemies / random spawn intervals
- Score system based on survival time
- Sound effects and background music
- Player left/right movement
- Different obstacle heights
- High-score saving

---

## Continuous Integration

A GitHub Actions workflow is included (`.github/workflows/ci.yml`).

It currently:
- Runs on every push and pull request
- Checks that the Lua code has valid syntax
- Can be extended later with linting, packaging a `.love` file, etc.

---

## License

This is a personal learning project. Feel free to use, modify and learn from it.
