import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../audio/audio_controller.dart';
import '../audio/sounds.dart';
import '../game_internals/level_state.dart';
import '../play_session/food.dart';

/// This widget defines the game UI itself, without things like the settings
/// button or the back button.
class LevelSix extends StatelessWidget {
  const LevelSix({super.key});

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
                    aspectRatio: 3/2,
                    child: Stack (
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          child: FractionallySizedBox(
                            heightFactor: 0.5,
                            widthFactor: 1/6,
                            child: LayoutBuilder(
                                builder: (context, constraints) => Visibility(
                                  visible: !levelState.checkDropped('sushi_3'),
                                  child: Draggable<String>(
                                    data: 'sushi_3',
                                    feedback: Container(
                                      width: constraints.maxWidth*1.05,
                                      child: Food(
                                      name: 'sushi_3',
                                      relativeWidth: 0.5,
                                      relativeHeight: 0.5,
                                      sprite: Image.asset('assets/images/foods/sushi_3.gif')
                                    )),
                                    childWhenDragging: Container(),
                                    child: Food(
                                      name: 'sushi_3',
                                      relativeWidth: 0.5,
                                      relativeHeight: 0.5,
                                      sprite: Image.asset('assets/images/foods/sushi_3.gif')
                                    ),
                                  ),
                                ),
                              ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          child: FractionallySizedBox(
                            heightFactor: 0.5,
                            widthFactor: 1/6,
                            child: LayoutBuilder(
                                builder: (context, constraints) => Visibility(
                                  visible: !levelState.checkDropped('sushi_2'),
                                  child: Draggable<String>(
                                    data: 'sushi_2',
                                    feedback: Container(
                                      width: constraints.maxWidth*1.05,
                                      child: Food(
                                      name: 'sushi_2',
                                      relativeWidth: 0.5,
                                      relativeHeight: 0.5,
                                      sprite: Image.asset('assets/images/foods/sushi_2.gif')
                                    )),
                                    childWhenDragging: Container(),
                                    child: Food(
                                      name: 'sushi_2',
                                      relativeWidth: 0.5,
                                      relativeHeight: 0.5,
                                      sprite: Image.asset('assets/images/foods/sushi_2.gif')
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        Container(
                          alignment: Alignment.bottomLeft,
                          child: FractionallySizedBox(
                            heightFactor: 0.5,
                            widthFactor: 1/6,
                            child: LayoutBuilder(
                                builder: (context, constraints) => Visibility(
                                  visible: !levelState.checkDropped('sushi_1'),
                                  child: Draggable<String>(
                                    data: 'sushi_1',
                                    feedback: Container(
                                      width: constraints.maxWidth*1.05,
                                      child: Food(
                                      name: 'sushi_1',
                                      relativeWidth: 0.5,
                                      relativeHeight: 0.5,
                                      sprite: Image.asset('assets/images/foods/sushi_1.gif')
                                    )),
                                    childWhenDragging: Container(),
                                    child: Food(
                                      name: 'sushi_1',
                                      relativeWidth: 0.5,
                                      relativeHeight: 0.5,
                                      sprite: Image.asset('assets/images/foods/sushi_1.gif')
                                    ),
                                  ),
                                ),
                              ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.topCenter,
                          child: FractionallySizedBox(
                            heightFactor: 0.5,
                            widthFactor: 1/3,
                            child: LayoutBuilder(
                                builder: (context, constraints) => Visibility(
                                  visible: !levelState.checkDropped('maki_2'),
                                  child: Draggable<String>(
                                    data: 'maki_2',
                                    feedback: Container(
                                      width: constraints.maxWidth*1.05,
                                      child: Food(
                                      name: 'maki_2',
                                      relativeWidth: 0.5,
                                      relativeHeight: 0.5,
                                      sprite: Image.asset('assets/images/foods/maki_2.gif')
                                    )),
                                    childWhenDragging: Container(),
                                    child: Food(
                                      name: 'maki_2',
                                      relativeWidth: 0.5,
                                      relativeHeight: 0.5,
                                      sprite: Image.asset('assets/images/foods/maki_2.gif')
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
                            widthFactor: 1/3,
                            child: LayoutBuilder(
                                builder: (context, constraints) => Visibility(
                                  visible: !levelState.checkDropped('maki_1'),
                                  child: Draggable<String>(
                                    data: 'maki_1',
                                    feedback: Container(
                                      width: constraints.maxWidth*1.05,
                                      child: Food(
                                      name: 'maki_1',
                                      relativeWidth: 0.5,
                                      relativeHeight: 0.5,
                                      sprite: Image.asset('assets/images/foods/maki_1.gif')
                                    )),
                                    childWhenDragging: Container(),
                                    child: Food(
                                      name: 'maki_1',
                                      relativeWidth: 0.5,
                                      relativeHeight: 0.5,
                                      sprite: Image.asset('assets/images/foods/maki_1.gif')
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
                    aspectRatio: 3/2,
                    child: Stack(
                      children: [
                        Image.asset('assets/images/foods/level_6_board.png'),
                        Container(
                          alignment: const Alignment(-0.85, -0.85),
                          child: FractionallySizedBox(
                            widthFactor: 0.25,
                            heightFactor: 0.5,
                            child: DragTarget<String>(
                              builder: (
                                BuildContext context,
                                List<dynamic> accepted,
                                List<dynamic> rejected,
                              ) {
                                debugPrint(levelState.progress.toString());
                                return Container(
                                  child: Image.asset(levelState.checkDropped('maki_1')
                                    ? 'assets/images/foods/maki_1.gif'
                                    : 'assets/images/foods/transparent_square.png')
                                );
                              },
                              onWillAccept: (data) {
                                return data == 'maki_1';
                              },
                              onAccept: (data) {
                                audioController.playSfx(SfxType.pop);
                                levelState.setProgress('maki_1');
                                levelState.evaluate();
                                debugPrint(levelState.progress.toString());
                              },
                            ),
                          ),
                        ),
                        Container(
                          alignment: const Alignment(-0.05, -0.85),
                          child: FractionallySizedBox(
                            widthFactor: 0.25,
                            heightFactor: 0.5,
                            child: DragTarget<String>(
                              builder: (
                                BuildContext context,
                                List<dynamic> accepted,
                                List<dynamic> rejected,
                              ) {
                                debugPrint(levelState.progress.toString());
                                return Container(
                                  child: Image.asset(levelState.checkDropped('maki_2')
                                    ? 'assets/images/foods/maki_2.gif'
                                    : 'assets/images/foods/transparent_square.png')
                                );
                              },
                              onWillAccept: (data) {
                                return data == 'maki_2';
                              },
                              onAccept: (data) {
                                audioController.playSfx(SfxType.pop);
                                levelState.setProgress('maki_2');
                                levelState.evaluate();
                                debugPrint(levelState.progress.toString());
                              },
                            ),
                          ),
                        ),
                        Container(
                          alignment: const Alignment(0.8, -0.85),
                          child: FractionallySizedBox(
                            widthFactor: 0.25,
                            heightFactor: 0.5,
                            child: DragTarget<String>(
                              builder: (
                                BuildContext context,
                                List<dynamic> accepted,
                                List<dynamic> rejected,
                              ) {
                                debugPrint(levelState.progress.toString());
                                return Container(
                                  child: Image.asset(levelState.checkDropped('maki_3')
                                    ? 'assets/images/foods/maki_3.gif'
                                    : 'assets/images/foods/transparent_square.png')
                                );
                              },
                              onWillAccept: (data) {
                                return data == 'maki_3';
                              },
                              onAccept: (data) {
                                audioController.playSfx(SfxType.pop);
                                levelState.setProgress('maki_3');
                                levelState.evaluate();
                                debugPrint(levelState.progress.toString());
                              },
                            ),
                          ),
                        ),
                        Container(
                          alignment: const Alignment(-0.85, 0.8),
                          child: FractionallySizedBox(
                            widthFactor: 0.13,
                            heightFactor: 0.45,
                            child: DragTarget<String>(
                              builder: (
                                BuildContext context,
                                List<dynamic> accepted,
                                List<dynamic> rejected,
                              ) {
                                debugPrint(levelState.progress.toString());
                                return Container(
                                  child: Image.asset(levelState.checkDropped('sushi_1')
                                    ? 'assets/images/foods/sushi_1.gif'
                                    : 'assets/images/foods/transparent_square.png')
                                );
                              },
                              onWillAccept: (data) {
                                return data == 'sushi_1';
                              },
                              onAccept: (data) {
                                audioController.playSfx(SfxType.pop);
                                levelState.setProgress('sushi_1');
                                levelState.evaluate();
                                debugPrint(levelState.progress.toString());
                              },
                            ),
                          ),
                        ),
                        Container(
                          alignment: const Alignment(-0.52, 0.8),
                          child: FractionallySizedBox(
                            widthFactor: 0.13,
                            heightFactor: 0.45,
                            child: DragTarget<String>(
                              builder: (
                                BuildContext context,
                                List<dynamic> accepted,
                                List<dynamic> rejected,
                              ) {
                                debugPrint(levelState.progress.toString());
                                return Container(
                                  child: Image.asset(levelState.checkDropped('sushi_2')
                                    ? 'assets/images/foods/sushi_2.gif'
                                    : 'assets/images/foods/transparent_square.png')
                                );
                              },
                              onWillAccept: (data) {
                                return data == 'sushi_2';
                              },
                              onAccept: (data) {
                                audioController.playSfx(SfxType.pop);
                                levelState.setProgress('sushi_2');
                                levelState.evaluate();
                                debugPrint(levelState.progress.toString());
                              },
                            ),
                          ),
                        ),
                        Container(
                          alignment: const Alignment(-0.18, 0.8),
                          child: FractionallySizedBox(
                            widthFactor: 0.13,
                            heightFactor: 0.45,
                            child: DragTarget<String>(
                              builder: (
                                BuildContext context,
                                List<dynamic> accepted,
                                List<dynamic> rejected,
                              ) {
                                debugPrint(levelState.progress.toString());
                                return Container(
                                  child: Image.asset(levelState.checkDropped('sushi_3')
                                    ? 'assets/images/foods/sushi_3.gif'
                                    : 'assets/images/foods/transparent_square.png')
                                );
                              },
                              onWillAccept: (data) {
                                return data == 'sushi_3';
                              },
                              onAccept: (data) {
                                audioController.playSfx(SfxType.pop);
                                levelState.setProgress('sushi_3');
                                levelState.evaluate();
                                debugPrint(levelState.progress.toString());
                              },
                            ),
                          ),
                        ),
                        Container(
                          alignment: const Alignment(0.18, 0.8),
                          child: FractionallySizedBox(
                            widthFactor: 0.13,
                            heightFactor: 0.45,
                            child: DragTarget<String>(
                              builder: (
                                BuildContext context,
                                List<dynamic> accepted,
                                List<dynamic> rejected,
                              ) {
                                debugPrint(levelState.progress.toString());
                                return Container(
                                  child: Image.asset(levelState.checkDropped('sushi_4')
                                    ? 'assets/images/foods/sushi_4.gif'
                                    : 'assets/images/foods/transparent_square.png')
                                );
                              },
                              onWillAccept: (data) {
                                return data == 'sushi_4';
                              },
                              onAccept: (data) {
                                audioController.playSfx(SfxType.pop);
                                levelState.setProgress('sushi_4');
                                levelState.evaluate();
                                debugPrint(levelState.progress.toString());
                              },
                            ),
                          ),
                        ),
                        Container(
                          alignment: const Alignment(0.52,0.8),
                          child: FractionallySizedBox(
                            widthFactor: 0.13,
                            heightFactor: 0.45,
                            child: DragTarget<String>(
                              builder: (
                                BuildContext context,
                                List<dynamic> accepted,
                                List<dynamic> rejected,
                              ) {
                                debugPrint(levelState.progress.toString());
                                return Container(
                                  child: Image.asset(levelState.checkDropped('sushi_5')
                                    ? 'assets/images/foods/sushi_5.gif'
                                    : 'assets/images/foods/transparent_square.png')
                                );
                              },
                              onWillAccept: (data) {
                                return data == 'sushi_5';
                              },
                              onAccept: (data) {
                                audioController.playSfx(SfxType.pop);
                                levelState.setProgress('sushi_5');
                                levelState.evaluate();
                                debugPrint(levelState.progress.toString());
                              },
                            ),
                          ),
                        ),
                        Container(
                          alignment: const Alignment(0.85, 0.8),
                          child: FractionallySizedBox(
                            widthFactor: 0.13,
                            heightFactor: 0.45,
                            child: DragTarget<String>(
                              builder: (
                                BuildContext context,
                                List<dynamic> accepted,
                                List<dynamic> rejected,
                              ) {
                                debugPrint(levelState.progress.toString());
                                return Container(
                                  child: Image.asset(levelState.checkDropped('sushi_6')
                                    ? 'assets/images/foods/sushi_6.gif'
                                    : 'assets/images/foods/transparent_square.png')
                                );
                              },
                              onWillAccept: (data) {
                                return data == 'sushi_6';
                              },
                              onAccept: (data) {
                                audioController.playSfx(SfxType.pop);
                                levelState.setProgress('sushi_6');
                                levelState.evaluate();
                                debugPrint(levelState.progress.toString());
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
                    aspectRatio: 3/2,
                    child: Stack (
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          child: FractionallySizedBox(
                            heightFactor: 0.5,
                            widthFactor: 1/6,
                            child: LayoutBuilder(
                                builder: (context, constraints) => Visibility(
                                  visible: !levelState.checkDropped('sushi_4'),
                                  child: Draggable<String>(
                                    data: 'sushi_4',
                                    feedback: Container(
                                      width: constraints.maxWidth*1.05,
                                      child: Food(
                                      name: 'sushi_4',
                                      relativeWidth: 0.5,
                                      relativeHeight: 0.5,
                                      sprite: Image.asset('assets/images/foods/sushi_4.gif')
                                    )),
                                    childWhenDragging: Container(),
                                    child: Food(
                                      name: 'sushi_4',
                                      relativeWidth: 0.5,
                                      relativeHeight: 0.5,
                                      sprite: Image.asset('assets/images/foods/sushi_4.gif')
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        Container(
                          alignment: Alignment.centerRight,
                          child: FractionallySizedBox(
                            heightFactor: 0.5,
                            widthFactor: 1/6,
                            child: LayoutBuilder(
                                builder: (context, constraints) => Visibility(
                                  visible: !levelState.checkDropped('sushi_5'),
                                  child: Draggable<String>(
                                    data: 'sushi_5',
                                    feedback: Container(
                                      width: constraints.maxWidth*1.05,
                                      child: Food(
                                      name: 'sushi_5',
                                      relativeWidth: 0.5,
                                      relativeHeight: 0.5,
                                      sprite: Image.asset('assets/images/foods/sushi_5.gif')
                                    )),
                                    childWhenDragging: Container(),
                                    child: Food(
                                      name: 'sushi_5',
                                      relativeWidth: 0.5,
                                      relativeHeight: 0.5,
                                      sprite: Image.asset('assets/images/foods/sushi_5.gif')
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        ),
                        Container(
                          alignment: Alignment.bottomLeft,
                          child: FractionallySizedBox(
                            heightFactor: 0.5,
                            widthFactor: 1/6,
                            child: LayoutBuilder(
                                builder: (context, constraints) => Visibility(
                                  visible: !levelState.checkDropped('sushi_6'),
                                  child: Draggable<String>(
                                    data: 'sushi_6',
                                    feedback: Container(
                                      width: constraints.maxWidth*1.05,
                                      child: Food(
                                      name: 'sushi_6',
                                      relativeWidth: 0.5,
                                      relativeHeight: 0.5,
                                      sprite: Image.asset('assets/images/foods/sushi_6.gif')
                                    )),
                                    childWhenDragging: Container(),
                                    child: Food(
                                      name: 'sushi_6',
                                      relativeWidth: 0.5,
                                      relativeHeight: 0.5,
                                      sprite: Image.asset('assets/images/foods/sushi_6.gif')
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        ),
                        Container(
                          alignment: Alignment.topCenter,
                          child: FractionallySizedBox(
                            heightFactor: 0.5,
                            widthFactor: 1/3,
                            child: LayoutBuilder(
                                builder: (context, constraints) => Visibility(
                                  visible: !levelState.checkDropped('maki_3'),
                                  child: Draggable<String>(
                                    data: 'maki_3',
                                    feedback: Container(
                                      width: constraints.maxWidth*1.05,
                                      child: Food(
                                      name: 'maki_3',
                                      relativeWidth: 0.5,
                                      relativeHeight: 0.5,
                                      sprite: Image.asset('assets/images/foods/maki_3.gif')
                                    )),
                                    childWhenDragging: Container(),
                                    child: Food(
                                      name: 'maki_3',
                                      relativeWidth: 0.5,
                                      relativeHeight: 0.5,
                                      sprite: Image.asset('assets/images/foods/maki_3.gif')
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
