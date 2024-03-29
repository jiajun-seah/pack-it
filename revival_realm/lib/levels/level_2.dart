import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../audio/audio_controller.dart';
import '../audio/sounds.dart';

import '../game_internals/level_state.dart';
import '../play_session/food.dart';

/// This widget defines the game UI itself, without things like the settings
/// button or the back button.
class LevelTwo extends StatelessWidget {
  const LevelTwo({super.key});

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
                          alignment: Alignment.topCenter,
                          child: FractionallySizedBox(
                            heightFactor: 0.45,
                            
                              child: LayoutBuilder(
                                builder: (context, constraints) => Visibility(
                                  visible: !levelState.checkDropped('sandwich_tr'),
                                  child: Draggable<String>(
                                    data: 'sandwich_tr',
                                    feedback: Container(
                                      width: constraints.maxWidth*.95,
                                      child: Food(
                                      name: 'sandwich_tr',
                                      relativeWidth: 0.5,
                                      relativeHeight: 0.5,
                                      sprite: Image.asset('assets/images/foods/sandwich_tr.gif')
                                    )),
                                    childWhenDragging: Container(),
                                    child: Food(
                                      name: 'sandwich_tr',
                                      relativeWidth: 0.5,
                                      relativeHeight: 0.5,
                                      sprite: Image.asset('assets/images/foods/sandwich_tr.gif')
                                    ),
                                  ),
                                ),
                              ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.bottomCenter,
                          child: FractionallySizedBox(
                            heightFactor: 0.45,
                            child: LayoutBuilder(
                                builder: (context, constraints) => Visibility(
                                  visible: !levelState.checkDropped('sandwich_bl'),
                                  child: Draggable<String>(
                                    data: 'sandwich_bl',
                                    feedback: Container(
                                      width: constraints.maxWidth*.95,
                                      child: Food(
                                      name: 'sandwich_bl',
                                      relativeWidth: 0.5,
                                      relativeHeight: 0.5,
                                      sprite: Image.asset('assets/images/foods/sandwich_bl.gif')
                                    )),
                                    childWhenDragging: Container(),
                                    child: Food(
                                      name: 'sandwich_bl',
                                      relativeWidth: 0.5,
                                      relativeHeight: 0.5,
                                      sprite: Image.asset('assets/images/foods/sandwich_bl.gif')
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
                        Image.asset('assets/images/foods/level_2_board.png'),
                        Container(
                          alignment: const Alignment(-0.825, -0.825),
                          child: FractionallySizedBox(
                            widthFactor: 0.45,
                            heightFactor: 0.45,
                            child: DragTarget<String>(
                              builder: (
                                BuildContext context,
                                List<dynamic> accepted,
                                List<dynamic> rejected,
                              ) {
                                return Container(
                                  child: Image.asset(levelState.checkDropped('sandwich_tl')
                                    ? 'assets/images/foods/sandwich_tl.gif'
                                    : 'assets/images/foods/transparent_square.png')
                                );
                              },
                              onWillAccept: (data) {
                                return data == 'sandwich_tl';
                              },
                              onAccept: (data) {
                                audioController.playSfx(SfxType.pop);
                                levelState.setProgress('sandwich_tl');
                                levelState.evaluate();
                              },
                            ),
                          ),
                        ),
                        Container(
                          alignment: const Alignment(0.825, -0.825),
                          child: FractionallySizedBox(
                            widthFactor: 0.45,
                            heightFactor: 0.45,
                            child: DragTarget<String>(
                              builder: (
                                BuildContext context,
                                List<dynamic> accepted,
                                List<dynamic> rejected,
                              ) {
                                return Container(
                                  child: Image.asset(levelState.checkDropped('sandwich_tr')
                                    ? 'assets/images/foods/sandwich_tr.gif'
                                    : 'assets/images/foods/transparent_square.png')
                                );
                              },
                              onWillAccept: (data) {
                                return data == 'sandwich_tr';
                              },
                              onAccept: (data) {
                                audioController.playSfx(SfxType.pop);
                                levelState.setProgress('sandwich_tr');
                                levelState.evaluate();
                              },
                            ),
                          ),
                        ),
                        Container(
                          alignment: const Alignment(-0.825, 0.825),
                          child: FractionallySizedBox(
                            widthFactor: 0.45,
                            heightFactor: 0.45,
                            child: DragTarget<String>(
                              builder: (
                                BuildContext context,
                                List<dynamic> accepted,
                                List<dynamic> rejected,
                              ) {
                                return Container(
                                  child: Image.asset(levelState.checkDropped('sandwich_bl')
                                    ? 'assets/images/foods/sandwich_bl.gif'
                                    : 'assets/images/foods/transparent_square.png')
                                );
                              },
                              onWillAccept: (data) {
                                return data == 'sandwich_bl';
                              },
                              onAccept: (data) {
                                audioController.playSfx(SfxType.pop);
                                levelState.setProgress('sandwich_bl');
                                levelState.evaluate();
                              },
                            ),
                          ),
                        ),
                        Container(
                          alignment: const Alignment(0.825, 0.825),
                          child: FractionallySizedBox(
                            widthFactor: 0.45,
                            heightFactor: 0.45,
                            child: DragTarget<String>(
                              builder: (
                                BuildContext context,
                                List<dynamic> accepted,
                                List<dynamic> rejected,
                              ) {
                                return Container(
                                  child: Image.asset(levelState.checkDropped('sandwich_br')
                                    ? 'assets/images/foods/sandwich_br.gif'
                                    : 'assets/images/foods/transparent_square.png')
                                );
                              },
                              onWillAccept: (data) {
                                return data == 'sandwich_br';
                              },
                              onAccept: (data) {
                                audioController.playSfx(SfxType.pop);
                                levelState.setProgress('sandwich_br');
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
                          alignment: Alignment.topCenter,
                          child: FractionallySizedBox(
                            heightFactor: 0.45,
                              child: LayoutBuilder(
                                builder: (context, constraints) => Visibility(
                                  visible: !levelState.checkDropped('sandwich_br'),
                                  child: Draggable<String>(
                                    data: 'sandwich_br',
                                    feedback: Container(
                                      width: constraints.maxWidth*.95,
                                      child: Food(
                                      name: 'sandwich_br',
                                      relativeWidth: 0.5,
                                      relativeHeight: 0.5,
                                      sprite: Image.asset('assets/images/foods/sandwich_br.gif')
                                    )),
                                    childWhenDragging: Container(),
                                    child: Food(
                                      name: 'sandwich_br',
                                      relativeWidth: 0.5,
                                      relativeHeight: 0.5,
                                      sprite: Image.asset('assets/images/foods/sandwich_br.gif')
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        ),
                        Container(
                          alignment: Alignment.bottomCenter,
                          child: FractionallySizedBox(
                            heightFactor: 0.45,
                              child: LayoutBuilder(
                                builder: (context, constraints) => Visibility(
                                  visible: !levelState.checkDropped('sandwich_tl'),
                                  child: Draggable<String>(
                                    data: 'sandwich_tl',
                                    feedback: Container(
                                      width: constraints.maxWidth*.95,
                                      child: Food(
                                      name: 'sandwich_tl',
                                      relativeWidth: 0.5,
                                      relativeHeight: 0.5,
                                      sprite: Image.asset('assets/images/foods/sandwich_tl.gif')
                                    )),
                                    childWhenDragging: Container(),
                                    child: Food(
                                      name: 'sandwich_tl',
                                      relativeWidth: 0.5,
                                      relativeHeight: 0.5,
                                      sprite: Image.asset('assets/images/foods/sandwich_tl.gif')
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
