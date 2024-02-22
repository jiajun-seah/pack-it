import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../audio/audio_controller.dart';
import '../audio/sounds.dart';

import '../game_internals/level_state.dart';
import '../play_session/food.dart';


/// This widget defines the game UI itself, without things like the settings
/// button or the back button.
class LevelFour extends StatelessWidget {
  const LevelFour({super.key});

  @override
  Widget build(BuildContext context) {
    final levelState = context.watch<LevelState>();
    final audioController = context.watch<AudioController>();
    
    return Column(
        children: [
          Expanded(
            child: Row(children: [
              Flexible(
                flex: 2,
                child: Center(
                  child: AspectRatio(
                    aspectRatio: 4/3,
                    child: Stack (
                      children: [
                        Container(
                          alignment: const Alignment(-0.25, 0),
                          child: FractionallySizedBox(
                            heightFactor: 1,
                            widthFactor: 0.5,
                            child: LayoutBuilder(
                                builder: (context, constraints) => Visibility(
                                  visible: !levelState.checkDropped('rice'),
                                  child: Draggable<String>(
                                    data: 'rice',
                                    feedback: Container(
                                      width: constraints.maxWidth*1.05,
                                      child: Food(
                                      name: 'rice',
                                      relativeWidth: 0.5,
                                      relativeHeight: 0.5,
                                      sprite: Image.asset('assets/images/foods/Rice_L.gif')
                                    )),
                                    childWhenDragging: Container(),
                                    child: Food(
                                      name: 'rice',
                                      relativeWidth: 0.5,
                                      relativeHeight: 0.5,
                                      sprite: Image.asset('assets/images/foods/Rice_L.gif')
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
                flex:3,
                child: Center(
                  child: AspectRatio(
                    aspectRatio: 4/3,
                    child: Stack(
                      children: [
                        Image.asset('assets/images/foods/level_4_board.png'),
                        Container(
                          alignment: const Alignment(-0.9, -0.2),
                          child: FractionallySizedBox(
                            widthFactor: 0.5,
                            heightFactor: 0.75,
                            child: DragTarget<String>(
                              builder: (
                                BuildContext context,
                                List<dynamic> accepted,
                                List<dynamic> rejected,
                              ) {
                                return Container(
                                  child: Image.asset(levelState.checkDropped('rice')
                                    ? 'assets/images/foods/Rice_L.gif'
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
                          alignment: const Alignment(0.3, -0.5),
                          child: FractionallySizedBox(
                            widthFactor: 0.2,
                            heightFactor: 1,
                            child: DragTarget<String>(
                              builder: (
                                BuildContext context,
                                List<dynamic> accepted,
                                List<dynamic> rejected,
                              ) {
                                return Container(
                                  // color: Colors.blue,
                                  child: Image.asset(levelState.checkDropped('stick')
                                    ? 'assets/images/foods/Stick.gif'
                                    : 'assets/images/foods/transparent_square.png')
                                );
                              },
                              onWillAccept: (data) {
                                return data == 'stick';
                              },
                              onAccept: (data) {
                                audioController.playSfx(SfxType.pop);
                                levelState.setProgress('stick');
                                levelState.evaluate();
                              },
                            ),
                          ),
                        ),
                        Container(
                          alignment: const Alignment(0.9, -0.65),
                          child: FractionallySizedBox(
                            widthFactor: 0.2,
                            heightFactor: 0.45,
                            child: DragTarget<String>(
                              builder: (
                                BuildContext context,
                                List<dynamic> accepted,
                                List<dynamic> rejected,
                              ) {
                                return Container(
                                  child: Image.asset(levelState.checkDropped('lettuce')
                                    ? 'assets/images/foods/Lettuce.gif'
                                    : 'assets/images/foods/transparent_square.png')
                                );
                              },
                              onWillAccept: (data) {
                                return data == 'lettuce';
                              },
                              onAccept: (data) {
                                audioController.playSfx(SfxType.pop);
                                levelState.setProgress('lettuce');
                                levelState.evaluate();
                              },
                            ),
                          ),
                        ),
                        Container(
                          alignment: const Alignment(0.9, 0.5),
                          child: FractionallySizedBox(
                            widthFactor: 0.2,
                            heightFactor: 0.25,
                            child: DragTarget<String>(
                              builder: (
                                BuildContext context,
                                List<dynamic> accepted,
                                List<dynamic> rejected,
                              ) {
                                return Container(
                                  // color: Colors.blue,
                                  child: Image.asset(levelState.checkDropped('mushroom')
                                    ? 'assets/images/foods/Mushroom.gif'
                                    : 'assets/images/foods/transparent_square.png')
                                );
                              },
                              onWillAccept: (data) {
                                return data == 'mushroom';
                              },
                              onAccept: (data) {
                                audioController.playSfx(SfxType.pop);
                                levelState.setProgress('mushroom');
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
                flex: 2,
                child: Center(
                  child: AspectRatio(
                    aspectRatio: 4/3,
                    child: Stack (
                      children: [
                        Container(
                          alignment: const Alignment(-0.25, -1),
                          child: FractionallySizedBox(
                            heightFactor: 1/3,
                            child: LayoutBuilder(
                                builder: (context, constraints) => Visibility(
                                  visible: !levelState.checkDropped('mushroom'),
                                  child: Draggable<String>(
                                    data: 'mushroom',
                                    feedback: Container(
                                      width: constraints.maxWidth*0.275,
                                      child: Food(
                                      name: 'mushroom',
                                      relativeWidth: 0.5,
                                      relativeHeight: 0.5,
                                      sprite: Image.asset('assets/images/foods/Mushroom.gif')
                                    )),
                                    childWhenDragging: Container(),
                                    child: Food(
                                      name: 'mushroom',
                                      relativeWidth: 0.5,
                                      relativeHeight: 0.5,
                                      sprite: Image.asset('assets/images/foods/Mushroom.gif')
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        ),
                        Container(
                          alignment: const Alignment(-0.25, 1),
                          child: FractionallySizedBox(
                            heightFactor: 2/3,
                            child: LayoutBuilder(
                                builder: (context, constraints) => Visibility(
                                  visible: !levelState.checkDropped('lettuce'),
                                  child: Draggable<String>(
                                    data: 'lettuce',
                                    feedback: Container(
                                      width: constraints.maxWidth*0.275,
                                      child: Food(
                                      name: 'lettuce',
                                      relativeWidth: 0.5,
                                      relativeHeight: 0.5,
                                      sprite: Image.asset('assets/images/foods/Lettuce.gif')
                                    )),
                                    childWhenDragging: Container(),
                                    child: Food(
                                      name: 'lettuce',
                                      relativeWidth: 0.5,
                                      relativeHeight: 0.5,
                                      sprite: Image.asset('assets/images/foods/Lettuce.gif')
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        ),
                        Container(
                          alignment: const Alignment(0.5, 0),
                          child: FractionallySizedBox(
                            heightFactor: 1,
                            child: LayoutBuilder(
                                builder: (context, constraints) => Visibility(
                                  visible: !levelState.checkDropped('stick'),
                                  child: Draggable<String>(
                                    data: 'stick',
                                    feedback: Container(
                                      width: constraints.maxWidth*0.275,
                                      child: Food(
                                      name: 'stick',
                                      relativeWidth: 0.5,
                                      relativeHeight: 0.5,
                                      sprite: Image.asset('assets/images/foods/Stick.gif')
                                    )),
                                    childWhenDragging: Container(),
                                    child: Food(
                                      name: 'stick',
                                      relativeWidth: 0.5,
                                      relativeHeight: 0.5,
                                      sprite: Image.asset('assets/images/foods/Stick.gif')
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
