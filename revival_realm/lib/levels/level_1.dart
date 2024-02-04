import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// import '../audio/audio_controller.dart';
// import '../audio/sounds.dart';
import '../game_internals/level_state.dart';
import '../level_selection/levels.dart';
import '../play_session/pixel.dart';
// import '../play_session/foods_mapping.dart';
import '../play_session/food.dart';

/// This widget defines the game UI itself, without things like the settings
/// button or the back button.
class LevelOne extends StatelessWidget {
  const LevelOne({super.key});

  @override
  Widget build(BuildContext context) {
    final level = context.watch<GameLevel>();
    final levelState = context.watch<LevelState>();

    return Column(
        children: [
          Text('Level ${level.id}'),
          Expanded(
            child: Row(children: [
              Flexible(
                flex: 1,
                child: Stack(
                  children: [
                    const SizedBox(
                      height: 500,
                      width: 500,
                    ),
                    Positioned(
                      top: 10,
                      left: 100,
                      child: Draggable<String>(
                        data: 'Red',
                        feedback: Food(
                          name: 'Red',
                          width: 230,
                          height: 230,
                          sprite: Image.asset('assets/images/foods/Red.png')
                        ),
                        childWhenDragging: Container(),
                        child: Food(
                          name: 'Red',
                          width: 230,
                          height: 230,
                          sprite: Image.asset('assets/images/foods/Red.png')
                        ),
                      ),
                    ),
                    Positioned(
                      // height: 250,
                      // width: 250,
                      top: 250,
                      left: 100,
                      child: Draggable<String>(
                        data: 'Blue',
                        feedback: Food(
                          name: 'Blue',
                          width: 230,
                          height: 230,
                          sprite: Image.asset('assets/images/foods/Blue.png')
                        ),
                        childWhenDragging: Container(),
                        child: Food(
                          name: 'Blue',
                          width: 230,
                          height: 230,
                          sprite: Image.asset('assets/images/foods/Blue.png')
                        ),
                      ),
                    ),
                    ],
                  ),
              ),
              Flexible(
                flex:2,
                child: GridView.count(
                  padding: const EdgeInsets.all(10),
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                  crossAxisCount: 2,
                  children: [
                    Container(
                      color: Colors.black12,
                      child: const Center(child: Text('0'))
                    ),
                    Container(
                      color: Colors.black12,
                      child: const Center(child: Text('1'))
                    ),
                    Container(
                      color: Colors.black12,
                      child: const Center(child: Text('2'))
                    ),
                    Container(
                      color: Colors.black12,
                      child: const Center(child: Text('3'))
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 1,
                child: Stack(
                  children: [
                    const SizedBox(
                      height: 500,
                      width: 500,
                    ),
                    Positioned(
                      // height: 250,
                      // width: 250,
                      top: 10,
                      left: 100,
                      child: Draggable<String>(
                        data: 'Yellow',
                        feedback: Food(
                          name: 'Yellow',
                          width: 230,
                          height: 230,
                          sprite: Image.asset('assets/images/foods/Yellow.png')
                        ),
                        childWhenDragging: Container(),
                        child: Food(
                          name: 'Yellow',
                          width: 230,
                          height: 230,
                          sprite: Image.asset('assets/images/foods/Yellow.png')
                        ),
                      ),
                    ),
                    Positioned(
                      // height: 250,
                      // width: 250,
                      top: 250,
                      left: 100,
                      child: Draggable<String>(
                        data: 'Green',
                        feedback: Food(
                          name: 'Green',
                          width: 230,
                          height: 230,
                          sprite: Image.asset('assets/images/foods/Green.png')
                        ),
                        childWhenDragging: Container(),
                        child: Food(
                          name: 'Green',
                          width: 230,
                          height: 230,
                          sprite: Image.asset('assets/images/foods/Green.png')
                        ),
                      ),
                    ),
                    ],
                  ),
              ),
            ],),
          )
        ],
      );
  }
}
