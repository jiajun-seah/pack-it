import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../audio/audio_controller.dart';
import '../audio/sounds.dart';

import '../game_internals/level_state.dart';
import '../play_session/food.dart';

/// This widget defines the game UI itself, without things like the settings
/// button or the back button.
class LevelSeven extends StatelessWidget {
  const LevelSeven({super.key});

  @override
  Widget build(BuildContext context) {
    final levelState = context.watch<LevelState>();

    final audioController = context.watch<AudioController>();
    
    return Column(
        children: [
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
                          alignment: Alignment.topLeft,
                          child: FractionallySizedBox(
                            heightFactor: 0.3,
                            child: LayoutBuilder(
                                builder: (context, constraints) => Visibility(
                                  visible: !levelState.checkDropped('chocolate_sprinkle'),
                                  child: Draggable<String>(
                                    data: 'chocolate_sprinkle',
                                    feedback: Container(
                                      width: constraints.maxWidth*0.62,
                                      child: Food(
                                      name: 'chocolate_sprinkle',
                                      relativeWidth: 0.5,
                                      relativeHeight: 0.5,
                                      sprite: Image.asset('assets/images/foods/Chocolate_Sprinkle.gif')
                                    )),
                                    childWhenDragging: Container(),
                                    child: Food(
                                      name: 'chocolate_sprinkle',
                                      relativeWidth: 0.5,
                                      relativeHeight: 0.5,
                                      sprite: Image.asset('assets/images/foods/Chocolate_Sprinkle.gif')
                                    ),
                                  ),
                                ),
                              ),
                              
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          child: FractionallySizedBox(
                            heightFactor: 0.3,
                            child: LayoutBuilder(
                                builder: (context, constraints) => Visibility(
                                  visible: !levelState.checkDropped('vanilla_glazed'),
                                  child: Draggable<String>(
                                    data: 'vanilla_glazed',
                                    feedback: Container(
                                      width: constraints.maxWidth*0.62,
                                      child: Food(
                                      name: 'vanilla_glazed',
                                      relativeWidth: 0.5,
                                      relativeHeight: 0.5,
                                      sprite: Image.asset('assets/images/foods/Vanilla_Glazed.gif')
                                    )),
                                    childWhenDragging: Container(),
                                    child: Food(
                                      name: 'vanilla_glazed',
                                      relativeWidth: 0.5,
                                      relativeHeight: 0.5,
                                      sprite: Image.asset('assets/images/foods/Vanilla_Glazed.gif')
                                    ),
                                  ),
                                ),
                              ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.bottomLeft,
                          child: FractionallySizedBox(
                            heightFactor: 0.3,
                            child: LayoutBuilder(
                                builder: (context, constraints) => Visibility(
                                  visible: !levelState.checkDropped('strawberry_swirl'),
                                  child: Draggable<String>(
                                    data: 'strawberry_swirl',
                                    feedback: Container(
                                      width: constraints.maxWidth*0.62,
                                      child: Food(
                                      name: 'strawberry_swirl',
                                      relativeWidth: 0.5,
                                      relativeHeight: 0.5,
                                      sprite: Image.asset('assets/images/foods/Strawberry_Swirl.gif')
                                    )),
                                    childWhenDragging: Container(),
                                    child: Food(
                                      name: 'strawberry_swirl',
                                      relativeWidth: 0.5,
                                      relativeHeight: 0.5,
                                      sprite: Image.asset('assets/images/foods/Strawberry_Swirl.gif')
                                    ),
                                  ),
                                ),
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
                        Image.asset('assets/images/foods/level_7_board.png'),
                        Container(
                          alignment: const Alignment(-0.9, -0.9),
                          child: FractionallySizedBox(
                            widthFactor: 0.3,
                            heightFactor: 0.3,
                            child: DragTarget<String>(
                              builder: (
                                BuildContext context,
                                List<dynamic> accepted,
                                List<dynamic> rejected,
                              ) {
                                return Container(
                                  child: Image.asset(levelState.checkDropped('vanilla_glazed')
                                    ? 'assets/images/foods/Vanilla_Glazed.gif'
                                    : 'assets/images/foods/transparent_square.png')
                                );
                              },
                              onWillAccept: (data) {
                                return data == 'vanilla_glazed';
                              },
                              onAccept: (data) {
                                audioController.playSfx(SfxType.pop);
                                levelState.setProgress('vanilla_glazed');
                                levelState.evaluate();
                              },
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: FractionallySizedBox(
                            widthFactor: 0.3,
                            heightFactor: 0.3,
                            child: DragTarget<String>(
                              builder: (
                                BuildContext context,
                                List<dynamic> accepted,
                                List<dynamic> rejected,
                              ) {
                                return Container(
                                  child: Image.asset(levelState.checkDropped('chocolate_sprinkle')
                                    ? 'assets/images/foods/Chocolate_Sprinkle.gif'
                                    : 'assets/images/foods/transparent_square.png')
                                );
                              },
                              onWillAccept: (data) {
                                return data == 'chocolate_sprinkle';
                              },
                              onAccept: (data) {
                                audioController.playSfx(SfxType.pop);
                                levelState.setProgress('chocolate_sprinkle');
                                levelState.evaluate();
                              },
                            ),
                          ),
                        ),
                        Container(
                          alignment: const Alignment(0.9, 0),
                          child: FractionallySizedBox(
                            widthFactor: 0.3,
                            heightFactor: 0.3,
                            child: DragTarget<String>(
                              builder: (
                                BuildContext context,
                                List<dynamic> accepted,
                                List<dynamic> rejected,
                              ) {
                                return Container(
                                  child: Image.asset(levelState.checkDropped('chocolate_swirl')
                                    ? 'assets/images/foods/Chocolate_Swirl.gif'
                                    : 'assets/images/foods/transparent_square.png')
                                );
                              },
                              onWillAccept: (data) {
                                return data == 'chocolate_swirl';
                              },
                              onAccept: (data) {
                                audioController.playSfx(SfxType.pop);
                                levelState.setProgress('chocolate_swirl');
                                levelState.evaluate();
                              },
                            ),
                          ),
                        ),
                        Container(
                          alignment: const Alignment(-0.9, 0.9),
                          child: FractionallySizedBox(
                            widthFactor: 0.3,
                            heightFactor: 0.3,
                            child: DragTarget<String>(
                              builder: (
                                BuildContext context,
                                List<dynamic> accepted,
                                List<dynamic> rejected,
                              ) {
                                return Container(
                                  child: Image.asset(levelState.checkDropped('strawberry_glazed')
                                    ? 'assets/images/foods/Strawberry_Glazed.gif'
                                    : 'assets/images/foods/transparent_square.png')
                                );
                              },
                              onWillAccept: (data) {
                                return data == 'strawberry_glazed';
                              },
                              onAccept: (data) {
                                audioController.playSfx(SfxType.pop);
                                levelState.setProgress('strawberry_glazed');
                                levelState.evaluate();
                              },
                            ),
                          ),
                        ),
                        Container(
                          alignment: const Alignment(0, 0.9),
                          child: FractionallySizedBox(
                            widthFactor: 0.3,
                            heightFactor: 0.3,
                            child: DragTarget<String>(
                              builder: (
                                BuildContext context,
                                List<dynamic> accepted,
                                List<dynamic> rejected,
                              ) {
                                return Container(
                                  child: Image.asset(levelState.checkDropped('strawberry_sprinkle')
                                    ? 'assets/images/foods/Strawberry_Sprinkle.gif'
                                    : 'assets/images/foods/transparent_square.png')
                                );
                              },
                              onWillAccept: (data) {
                                return data == 'strawberry_sprinkle';
                              },
                              onAccept: (data) {
                                audioController.playSfx(SfxType.pop);
                                levelState.setProgress('strawberry_sprinkle');
                                levelState.evaluate();
                              },
                            ),
                          ),
                        ),
                        Container(
                          alignment: const Alignment(0.9, 0.9),
                          child: FractionallySizedBox(
                            widthFactor: 0.3,
                            heightFactor: 0.3,
                            child: DragTarget<String>(
                              builder: (
                                BuildContext context,
                                List<dynamic> accepted,
                                List<dynamic> rejected,
                              ) {
                                return Container(
                                  child: Image.asset(levelState.checkDropped('strawberry_swirl')
                                    ? 'assets/images/foods/Strawberry_Swirl.gif'
                                    : 'assets/images/foods/transparent_square.png')
                                );
                              },
                              onWillAccept: (data) {
                                return data == 'strawberry_swirl';
                              },
                              onAccept: (data) {
                                audioController.playSfx(SfxType.pop);
                                levelState.setProgress('strawberry_swirl');
                                levelState.evaluate();
                              },
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
                child: Center(
                  child: AspectRatio(
                    aspectRatio: 1/2,
                    child: Stack (
                      children: [
                        Container(
                          alignment: Alignment.topRight,
                          child: FractionallySizedBox(
                            heightFactor: 0.3,
                            child: LayoutBuilder(
                                builder: (context, constraints) => Visibility(
                                  visible: !levelState.checkDropped('strawberry_glazed'),
                                  child: Draggable<String>(
                                    data: 'strawberry_glazed',
                                    feedback: Container(
                                      width: constraints.maxWidth*0.62,
                                      child: Food(
                                      name: 'strawberry_glazed',
                                      relativeWidth: 0.5,
                                      relativeHeight: 0.5,
                                      sprite: Image.asset('assets/images/foods/Strawberry_Glazed.gif')
                                    )),
                                    childWhenDragging: Container(),
                                    child: Food(
                                      name: 'strawberry_glazed',
                                      relativeWidth: 0.5,
                                      relativeHeight: 0.5,
                                      sprite: Image.asset('assets/images/foods/Strawberry_Glazed.gif')
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: FractionallySizedBox(
                            heightFactor: 0.3,
                            child: LayoutBuilder(
                                builder: (context, constraints) => Visibility(
                                  visible: !levelState.checkDropped('strawberry_sprinkle'),
                                  child: Draggable<String>(
                                    data: 'strawberry_sprinkle',
                                    feedback: Container(
                                      width: constraints.maxWidth*0.62,
                                      child: Food(
                                      name: 'strawberry_sprinkle',
                                      relativeWidth: 0.5,
                                      relativeHeight: 0.5,
                                      sprite: Image.asset('assets/images/foods/Strawberry_Sprinkle.gif')
                                    )),
                                    childWhenDragging: Container(),
                                    child: Food(
                                      name: 'strawberry_sprinkle',
                                      relativeWidth: 0.5,
                                      relativeHeight: 0.5,
                                      sprite: Image.asset('assets/images/foods/Strawberry_Sprinkle.gif')
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        ),
                        Container(
                          alignment: Alignment.bottomRight,
                          child: FractionallySizedBox(
                            heightFactor: 0.3,
                            child: LayoutBuilder(
                                builder: (context, constraints) => Visibility(
                                  visible: !levelState.checkDropped('chocolate_swirl'),
                                  child: Draggable<String>(
                                    data: 'chocolate_swirl',
                                    feedback: Container(
                                      width: constraints.maxWidth*0.62,
                                      child: Food(
                                      name: 'chocolate_swirl',
                                      relativeWidth: 0.5,
                                      relativeHeight: 0.5,
                                      sprite: Image.asset('assets/images/foods/Chocolate_Swirl.gif')
                                    )),
                                    childWhenDragging: Container(),
                                    child: Food(
                                      name: 'chocolate_swirl',
                                      relativeWidth: 0.5,
                                      relativeHeight: 0.5,
                                      sprite: Image.asset('assets/images/foods/Chocolate_Swirl.gif')
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        ),
                      ],)
                  ),
                ),
              ),
            ],),
          )
        ],
      );
  }
}
