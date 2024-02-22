import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../audio/audio_controller.dart';
import '../audio/sounds.dart';

import '../game_internals/level_state.dart';
import '../play_session/food.dart';

/// This widget defines the game UI itself, without things like the settings
/// button or the back button.
class LevelEight extends StatelessWidget {
  const LevelEight({super.key});

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
                            heightFactor: 1/6,
                            child: Container(
                              // color: Colors.black12,
                              child: LayoutBuilder(
                                builder: (context, constraints) => Visibility(
                                  visible: !levelState.checkDropped('blackcurrent'),
                                  child: Draggable<String>(
                                    data: 'blackcurrent',
                                    feedback: Container(
                                      width: constraints.maxWidth*0.35,
                                      child: Food(
                                      name: 'blackcurrent',
                                      relativeWidth: 0.5,
                                      relativeHeight: 0.5,
                                      sprite: Image.asset('assets/images/foods/Blackcurrent.gif')
                                    )),
                                    childWhenDragging: Container(),
                                    child: Food(
                                      name: 'blackcurrent',
                                      relativeWidth: 0.5,
                                      relativeHeight: 0.5,
                                      sprite: Image.asset('assets/images/foods/Blackcurrent.gif')
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          child: FractionallySizedBox(
                            heightFactor: 0.28,
                            child: Container(
                              // color: Colors.black12,
                              child: LayoutBuilder(
                                builder: (context, constraints) => Visibility(
                                  visible: !levelState.checkDropped('pear'),
                                  child: Draggable<String>(
                                    data: 'pear',
                                    feedback: Container(
                                      width: constraints.maxWidth*0.6,
                                      child: Food(
                                      name: 'pear',
                                      relativeWidth: 0.5,
                                      relativeHeight: 0.5,
                                      sprite: Image.asset('assets/images/foods/Pear.gif')
                                    )),
                                    childWhenDragging: Container(),
                                    child: Food(
                                      name: 'pear',
                                      relativeWidth: 0.5,
                                      relativeHeight: 0.5,
                                      sprite: Image.asset('assets/images/foods/Pear.gif')
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.bottomLeft,
                          child: FractionallySizedBox(
                            heightFactor: 1/9,
                            child: Container(
                              // color: Colors.black12,
                              child: LayoutBuilder(
                                builder: (context, constraints) => Visibility(
                                  visible: !levelState.checkDropped('grape'),
                                  child: Draggable<String>(
                                    data: 'grape',
                                    feedback: Container(
                                      width: constraints.maxWidth*0.25,
                                      child: Food(
                                      name: 'grape',
                                      relativeWidth: 0.5,
                                      relativeHeight: 0.5,
                                      sprite: Image.asset('assets/images/foods/Grape.gif')
                                    )),
                                    childWhenDragging: Container(),
                                    child: Food(
                                      name: 'grape',
                                      relativeWidth: 0.5,
                                      relativeHeight: 0.5,
                                      sprite: Image.asset('assets/images/foods/Grape.gif')
                                    ),
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
                        Image.asset('assets/images/foods/level_8_board.png'),
                        Container(
                          alignment: Alignment.topCenter,
                          child: FractionallySizedBox(
                            widthFactor: 0.333,
                            heightFactor: 0.333,
                            child: DragTarget<String>(
                              builder: (
                                BuildContext context,
                                List<dynamic> accepted,
                                List<dynamic> rejected,
                              ) {
                                return Container(
                                  alignment: Alignment.center,
                                  child: FractionallySizedBox(
                                    widthFactor: 1/3,
                                    child: Image.asset(levelState.checkDropped('grape')
                                      ? 'assets/images/foods/Grape.gif'
                                      : 'assets/images/foods/transparent_square.png'),
                                  )
                                );
                              },
                              onWillAccept: (data) {
                                return data == 'grape';
                              },
                              onAccept: (data) {
                                audioController.playSfx(SfxType.pop);
                                levelState.setProgress('grape');
                                levelState.evaluate();
                              },
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.topRight,
                          child: FractionallySizedBox(
                            widthFactor: 0.333,
                            heightFactor: 0.333,
                            child: DragTarget<String>(
                              builder: (
                                BuildContext context,
                                List<dynamic> accepted,
                                List<dynamic> rejected,
                              ) {
                                return Container(
                                  alignment: Alignment.center,
                                  child: FractionallySizedBox(
                                    widthFactor: 1/3,
                                    child: Image.asset(levelState.checkDropped('blueberry')
                                      ? 'assets/images/foods/Blueberry.gif'
                                      : 'assets/images/foods/transparent_square.png'),
                                  )
                                );
                              },
                              onWillAccept: (data) {
                                return data == 'blueberry';
                              },
                              onAccept: (data) {
                                audioController.playSfx(SfxType.pop);
                                levelState.setProgress('blueberry');
                                levelState.evaluate();
                              },
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: FractionallySizedBox(
                            widthFactor: 0.333,
                            heightFactor: 0.333,
                            child: DragTarget<String>(
                              builder: (
                                BuildContext context,
                                List<dynamic> accepted,
                                List<dynamic> rejected,
                              ) {
                                return Container(
                                  alignment: Alignment.center,
                                  // color: Colors.blue,
                                  child: FractionallySizedBox(
                                    widthFactor: 2/3,
                                    child: Image.asset(levelState.checkDropped('strawberry')
                                      ? 'assets/images/foods/Strawberry.gif'
                                      : 'assets/images/foods/transparent_square.png'),
                                  )
                                );
                              },
                              onWillAccept: (data) {
                                return data == 'strawberry';
                              },
                              onAccept: (data) {
                                audioController.playSfx(SfxType.pop);
                                levelState.setProgress('strawberry');
                                levelState.evaluate();
                              },
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          child: FractionallySizedBox(
                            widthFactor: 0.333,
                            heightFactor: 0.333,
                            child: DragTarget<String>(
                              builder: (
                                BuildContext context,
                                List<dynamic> accepted,
                                List<dynamic> rejected,
                              ) {
                                return Container(
                                  alignment: Alignment.center,
                                  // color: Colors.blue,
                                  child: FractionallySizedBox(
                                    widthFactor: 1/2,
                                    child: Image.asset(levelState.checkDropped('blackcurrent')
                                      ? 'assets/images/foods/Blackcurrent.gif'
                                      : 'assets/images/foods/transparent_square.png'),
                                  )
                                );
                              },
                              onWillAccept: (data) {
                                return data == 'blackcurrent';
                              },
                              onAccept: (data) {
                                audioController.playSfx(SfxType.pop);
                                levelState.setProgress('blackcurrent');
                                levelState.evaluate();
                              },
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment(-0.9, 0.9),
                          child: FractionallySizedBox(
                            widthFactor: 0.28,
                            heightFactor: 0.28,
                            child: DragTarget<String>(
                              builder: (
                                BuildContext context,
                                List<dynamic> accepted,
                                List<dynamic> rejected,
                              ) {
                                return Container(
                                  child: Image.asset(levelState.checkDropped('apple')
                                    ? 'assets/images/foods/Apple.gif'
                                    : 'assets/images/foods/transparent_square.png')
                                );
                              },
                              onWillAccept: (data) {
                                return data == 'apple';
                              },
                              onAccept: (data) {
                                audioController.playSfx(SfxType.pop);
                                levelState.setProgress('apple');
                                levelState.evaluate();
                              },
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment(0, 0.9),
                          child: FractionallySizedBox(
                            widthFactor: 0.28,
                            heightFactor: 0.28,
                            child: DragTarget<String>(
                              builder: (
                                BuildContext context,
                                List<dynamic> accepted,
                                List<dynamic> rejected,
                              ) {
                                return Container(
                                  child: Image.asset(levelState.checkDropped('pear')
                                    ? 'assets/images/foods/Pear.gif'
                                    : 'assets/images/foods/transparent_square.png')
                                );
                              },
                              onWillAccept: (data) {
                                return data == 'pear';
                              },
                              onAccept: (data) {
                                audioController.playSfx(SfxType.pop);
                                levelState.setProgress('pear');
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
                            heightFactor: 1/3,
                            child: Container(
                              // color: Colors.black12,
                              child: LayoutBuilder(
                                builder: (context, constraints) => Visibility(
                                  visible: !levelState.checkDropped('apple'),
                                  child: Draggable<String>(
                                    data: 'apple',
                                    feedback: Container(
                                      width: constraints.maxWidth*0.7,
                                      child: Food(
                                      name: 'apple',
                                      relativeWidth: 0.5,
                                      relativeHeight: 0.5,
                                      sprite: Image.asset('assets/images/foods/Apple.gif')
                                    )),
                                    childWhenDragging: Container(),
                                    child: Food(
                                      name: 'apple',
                                      relativeWidth: 0.5,
                                      relativeHeight: 0.5,
                                      sprite: Image.asset('assets/images/foods/Apple.gif')
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: FractionallySizedBox(
                            heightFactor: 1/4,
                            child: Container(
                              // color: Colors.black12,
                              child: LayoutBuilder(
                                builder: (context, constraints) => Visibility(
                                  visible: !levelState.checkDropped('strawberry'),
                                  child: Draggable<String>(
                                    data: 'strawberry',
                                    feedback: Container(
                                      width: constraints.maxWidth*0.52,
                                      child: Food(
                                      name: 'strawberry',
                                      relativeWidth: 0.5,
                                      relativeHeight: 0.5,
                                      sprite: Image.asset('assets/images/foods/Strawberry.gif')
                                    )),
                                    childWhenDragging: Container(),
                                    child: Food(
                                      name: 'strawberry',
                                      relativeWidth: 0.5,
                                      relativeHeight: 0.5,
                                      sprite: Image.asset('assets/images/foods/Strawberry.gif')
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.bottomRight,
                          child: FractionallySizedBox(
                            heightFactor: 1/9,
                            child: Container(
                              // color: Colors.black12,
                              child: LayoutBuilder(
                                builder: (context, constraints) => Visibility(
                                  visible: !levelState.checkDropped('blueberry'),
                                  child: Draggable<String>(
                                    data: 'blueberry',
                                    feedback: Container(
                                      width: constraints.maxWidth*0.25,
                                      child: Food(
                                      name: 'blueberry',
                                      relativeWidth: 0.5,
                                      relativeHeight: 0.5,
                                      sprite: Image.asset('assets/images/foods/Blueberry.gif')
                                    )),
                                    childWhenDragging: Container(),
                                    child: Food(
                                      name: 'blueberry',
                                      relativeWidth: 0.5,
                                      relativeHeight: 0.5,
                                      sprite: Image.asset('assets/images/foods/Blueberry.gif')
                                    ),
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
