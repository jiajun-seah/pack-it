import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// import '../audio/audio_controller.dart';
// import '../audio/sounds.dart';
import '../game_internals/level_state.dart';
import '../level_selection/levels.dart';
// import '../play_session/pixel.dart';
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
                child: Center(
                  child: AspectRatio(
                    aspectRatio: 1/2,
                    child: Stack (
                      children: [
                        Container(
                          alignment: Alignment.topCenter,
                          child: FractionallySizedBox(
                            heightFactor: 0.5,
                            child: Container(
                              color: Colors.black12,
                              child: LayoutBuilder(
                                builder: (context, constraints) => Draggable<String>(
                                  data: 'Red',
                                  feedback: Container(
                                    width: constraints.maxWidth,
                                    child: Food(
                                    name: 'Red',
                                    relativeWidth: 0.5,
                                    relativeHeight: 0.5,
                                    sprite: Image.asset('assets/images/foods/Red_L.png')
                                  )),
                                  childWhenDragging: Container(),
                                  child: Food(
                                    name: 'Red',
                                    relativeWidth: 0.5,
                                    relativeHeight: 0.5,
                                    sprite: Image.asset('assets/images/foods/Red_L.png')
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.bottomCenter,
                          child: FractionallySizedBox(
                            heightFactor: 0.5,
                            child: Container(
                              color: Colors.blue
                            ),
                          ),
                        ),
                      ],)
                  ),
                ),
              ),
              Flexible(
                flex:2,
                child: Center(
                  child: AspectRatio(
                    aspectRatio: 1/1,
                    child: Stack(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          child: FractionallySizedBox(
                            widthFactor: 0.5,
                            heightFactor: 0.5,
                            child: Container(
                              color: Colors.red,
                              // child: Image.asset('assets/images/foods/Blue.png', fit: BoxFit.fill,)
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.topRight,
                          child: FractionallySizedBox(
                            widthFactor: 0.5,
                            heightFactor: 0.5,
                            child: Container(
                              color: Colors.blue,
                              child: const Center(child: Text('1'))
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.bottomLeft,
                          child: FractionallySizedBox(
                            widthFactor: 0.5,
                            heightFactor: 0.5,
                            child: Container(
                              color: Colors.green,
                              child: const Center(child: Text('2'))
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.bottomRight,
                          child: FractionallySizedBox(
                            widthFactor: 0.5,
                            heightFactor: 0.5,
                            child: Container(
                              color: Colors.yellow,
                              child: const Center(child: Text('3'))
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Stack(
                  children: [
                    Positioned(
                      // height: 250,
                      // width: 250,
                      top: 10,
                      left: 100,
                      child: Draggable<String>(
                        data: 'Yellow',
                        feedback: Food(
                          name: 'Yellow',
                          relativeWidth: 0.5,
                          relativeHeight: 0.5,
                          sprite: Image.asset('assets/images/foods/Yellow.png', fit: BoxFit.fill,)
                        ),
                        childWhenDragging: Container(),
                        child: Food(
                          name: 'Yellow',
                          relativeWidth: 230,
                          relativeHeight: 230,
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
                          relativeWidth: 0.5,
                          relativeHeight: 0.5,
                          sprite: Image.asset('assets/images/foods/Green.png')
                        ),
                        childWhenDragging: Container(),
                        child: Food(
                          name: 'Green',
                          relativeWidth: 0.5,
                          relativeHeight: 0.5,
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
