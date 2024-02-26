# Pack-It!
Pack-It! is a puzzle game that encourages players to bring their own lunchboxes instead of using disposable plastics when ordering takeaway food.
The game is primarily built for web but was later extended to macOS as well (experimental).
![title_background_static](https://github.com/jiajun-seah/pack-it/assets/77622894/8b2e7e2d-ec57-4834-a66c-12c8dd1dadf9)

# Description
Developed using Dart and Flutter, Pack-It! is an app-like game developed to encourage players to swap the use of single-use plastics for their own reusable lunchboxes. 
Comprising a total of 8 unqiue levels, use context clues such as position, colours, size and design patterns to solve each level. The completion of a level rewards players with a winning screen that replaces the use of a styrofoam box with a lunchbox wrapped in a colourful cloth (inspired by traditional Japanese wrapping cloths called Furoshiki, traditionally used to wrap goods) with a symbol of a plant or flower.

# Installation
You can access the game directly via the web app hosted on Firebase at the following link: https://pack-it-game.web.app/  

If you wish to run the game locally, clone this repo, then ```flutter run```. The game is developed for web and MacOS.

Note: Remember to set up Flutter for web and MacOS respectively (See: https://docs.flutter.dev/platform-integration/web/building and https://docs.flutter.dev/platform-integration/macos/building) if you have not done so.

# Features
Pack your takeaway food into your reusable lunchbox! But wait, it is not that simple... there are ideal positions for you to arrange your food. 
## Gameplay Mechanics
- Use context clues (shape, colour, size etc.) to solve the puzzle hidden in each level for a successful bento box. Understanding the pattern required for each level is key to solving the puzzle.
- Each level is timed to show you how long you took to complete the level.
- Win screen after each level educates players on the harmful effects of single-use plastics, especially those made out of styrofoam.
## Level Design
- Each level comes with a reusable lunchbox in the centre of the screen, with food items surrounding it.
- Each food item is draggable (works with mouse and touch gesture) and have a pre-determined position in the lunchbox.
- To finish a level, put all food items into the correct positions.
## Graphics and Art Style
- The game's art style follows that of a colourful, "chalk" painting style, to attract players.
- Colours are chosen from a set palette to ensure game cohesiveness and to make use of colours creatively.
- Some amount of colour theory was used to select game elements (eg. colours of wrapping clothes should generally be complementary to that of the lunchbox).
## Sound and Music
- Relaxing acoustic guitar melody played on loop to enhance the chill mood of the game.
- Sounds are added when navigating between pages to provide responsiveness to players.
- Sounds are added when dropping food into the correct positions and on level victory as a audio cue to players.
  
# Assets
Read about how I created the assets myself in [this article](https://medium.com/@orangepufflejj/pixel-perfect-how-i-made-a-flutter-game-from-start-to-finish-6e78cfb3629f)

## Game Art
All game assets are handdrawn using Procreate on iPad Air (3rd Generation). A palette was used to ensure cohesiveness of the game design (https://lospec.com/palette-list/resurrect-64)

## Music
All game music and sound effects are made using Apple Garageband.

# Screenshots
## Title Screen
<img width="1468" alt="Screenshot 2024-02-22 at 9 07 35 PM" src="https://github.com/jiajun-seah/pack-it/assets/77622894/b7ed19b2-149c-4bea-b1dc-1760f32297bd">

## Gameplay
<img width="1466" alt="Screenshot 2024-02-22 at 9 09 10 PM" src="https://github.com/jiajun-seah/pack-it/assets/77622894/c76d05f7-bc3d-4dbb-987d-b64ad36d78e9">
<img width="1465" alt="Screenshot 2024-02-22 at 9 08 36 PM" src="https://github.com/jiajun-seah/pack-it/assets/77622894/e3352cc5-41cb-4a93-acba-ed921aff828e">
<img width="1469" alt="Screenshot 2024-02-22 at 9 10 01 PM" src="https://github.com/jiajun-seah/pack-it/assets/77622894/e7f4c541-c3ee-47b4-b9e1-2c5e8ed561e8">
<img width="1464" alt="Screenshot 2024-02-22 at 9 09 49 PM" src="https://github.com/jiajun-seah/pack-it/assets/77622894/d9df1b03-67ce-429a-afe8-c1cfbafc556e">

## Settings
<img width="1460" alt="Screenshot 2024-02-22 at 9 08 05 PM" src="https://github.com/jiajun-seah/pack-it/assets/77622894/e7504460-0ddf-4da9-8d4a-082c0ad11b87">

## Special Thanks
1. Special thanks to the dev team of Flutter Casual Games Toolkit for providing the game templates. The templates have pre-implemented the essentials of a app-like game so that the focus can be placed on designing actual gameplay. Check them out here: https://flutter.dev/games
2. Huge thank you to friends and family who have playtested the game and were involved one way or another, such as conducting UAT, providing advice on game art etc. I hope this little pet project of mine has cheered up your day :)

