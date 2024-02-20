import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:google_fonts/google_fonts.dart';
import '../audio/audio_controller.dart';
import '../audio/sounds.dart';
import '../game_internals/level_state.dart';
import '../level_selection/levels.dart';
import '../play_session/food.dart';

/// This widget defines the game UI itself, without things like the settings
/// button or the back button.
class LevelOne extends StatelessWidget {
  const LevelOne({super.key});

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
                          alignment: Alignment.center,
                          child: FractionallySizedBox(
                            heightFactor: 0.875,
                            child: LayoutBuilder(
                                builder: (context, constraints) => Visibility(
                                  visible: !levelState.checkDropped('rice'),
                                  child: Draggable<String>(
                                    data: 'rice',
                                    feedback: Container(
                                      width: constraints.maxWidth*0.9,
                                      child: Food(
                                      name: 'rice',
                                      relativeWidth: 0.5,
                                      relativeHeight: 0.5,
                                      sprite: Image.asset('assets/images/foods/rice_L2.gif')
                                    )),
                                    childWhenDragging: Container(),
                                    child: Food(
                                      name: 'rice',
                                      relativeWidth: 0.5,
                                      relativeHeight: 0.5,
                                      sprite: Image.asset('assets/images/foods/rice_L2.gif')
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
                        Image.asset('assets/images/foods/level_1_board.png'),
                        Container(
                          alignment: const Alignment(-0.9, 0),
                          child: FractionallySizedBox(
                            widthFactor: 0.45,
                            heightFactor: 1,
                            child: DragTarget<String>(
                              builder: (
                                BuildContext context,
                                List<dynamic> accepted,
                                List<dynamic> rejected,
                              ) {
                                return Container(
                                  // color: Colors.blue,
                                  child: Image.asset(levelState.checkDropped('rice')
                                    ? 'assets/images/foods/rice_L2.gif'
                                    : 'assets/images/foods/transparent_square.png')
                                );
                              },
                              onWillAccept: (data) {
                                return data == 'rice';
                              },
                              onAccept: (data) {
                                audioController.playSfx(SfxType.pop);
                                levelState.setProgress('rice');
                                levelState.evaluate();
                              },
                            ),
                          ),
                        ),
                        Container(
                          alignment: const Alignment(0.9, 0),
                          child: FractionallySizedBox(
                            widthFactor: 0.45,
                            heightFactor: 1,
                            child: DragTarget<String>(
                              builder: (
                                BuildContext context,
                                List<dynamic> accepted,
                                List<dynamic> rejected,
                              ) {
                                return Container(
                                  child: Image.asset(levelState.checkDropped('curry')
                                    ? 'assets/images/foods/curry_L.gif'
                                    : 'assets/images/foods/transparent_square.png')
                                );
                              },
                              onWillAccept: (data) {
                                return data == 'curry';
                              },
                              onAccept: (data) {
                                audioController.playSfx(SfxType.pop);
                                levelState.setProgress('curry');
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
                          alignment: Alignment.center,
                          child: FractionallySizedBox(
                            heightFactor: 0.875,
                              child: LayoutBuilder(
                                builder: (context, constraints) => Visibility(
                                  visible: !levelState.checkDropped('curry'),
                                  child: Draggable<String>(
                                    data: 'curry',
                                    feedback: Container(
                                      width: constraints.maxWidth*0.9,
                                      child: Food(
                                      name: 'curry',
                                      relativeWidth: 0.5,
                                      relativeHeight: 0.5,
                                      sprite: Image.asset('assets/images/foods/curry_L.gif')
                                    )),
                                    childWhenDragging: Container(),
                                    child: Food(
                                      name: 'curry',
                                      relativeWidth: 0.5,
                                      relativeHeight: 0.5,
                                      sprite: Image.asset('assets/images/foods/curry_L.gif')
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
