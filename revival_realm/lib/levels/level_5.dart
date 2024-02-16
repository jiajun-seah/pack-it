import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// import '../audio/audio_controller.dart';
// import '../audio/sounds.dart';
import '../game_internals/level_state.dart';
import '../level_selection/levels.dart';
import '../play_session/food.dart';

/// This widget defines the game UI itself, without things like the settings
/// button or the back button.
class LevelFive extends StatelessWidget {
  const LevelFive({super.key});

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
                            heightFactor: 0.25,
                            child: Container(
                              // color: Colors.black12,
                              child: LayoutBuilder(
                                builder: (context, constraints) => Visibility(
                                  visible: !levelState.checkDropped('orange_swiss'),
                                  child: Draggable<String>(
                                    data: 'orange_swiss',
                                    feedback: Container(
                                      width: constraints.maxWidth*0.525,
                                      child: Food(
                                      name: 'orange_swiss',
                                      relativeWidth: 0.5,
                                      relativeHeight: 0.5,
                                      sprite: Image.asset('assets/images/foods/Orange_Swiss.gif')
                                    )),
                                    childWhenDragging: Container(),
                                    child: Food(
                                      name: 'orange_swiss',
                                      relativeWidth: 0.5,
                                      relativeHeight: 0.5,
                                      sprite: Image.asset('assets/images/foods/Orange_Swiss.gif')
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.bottomCenter,
                          child: FractionallySizedBox(
                            heightFactor: 0.25,
                            child: Container(
                              // color: Colors.black12,
                              child: LayoutBuilder(
                                builder: (context, constraints) => Visibility(
                                  visible: !levelState.checkDropped('lime_swiss'),
                                  child: Draggable<String>(
                                    data: 'lime_swiss',
                                    feedback: Container(
                                      width: constraints.maxWidth*0.525,
                                      child: Food(
                                      name: 'lime_swiss',
                                      relativeWidth: 0.5,
                                      relativeHeight: 0.5,
                                      sprite: Image.asset('assets/images/foods/Lime_Swiss.gif')
                                    )),
                                    childWhenDragging: Container(),
                                    child: Food(
                                      name: 'lime_swiss',
                                      relativeWidth: 0.5,
                                      relativeHeight: 0.5,
                                      sprite: Image.asset('assets/images/foods/Lime_Swiss.gif')
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
                        Image.asset('assets/images/foods/level_5_board.png'),
                        Container(
                          alignment: Alignment.center,
                          child: FractionallySizedBox(
                            widthFactor: 0.25,
                            heightFactor: 0.25,
                            child: DragTarget<String>(
                              builder: (
                                BuildContext context,
                                List<dynamic> accepted,
                                List<dynamic> rejected,
                              ) {
                                debugPrint(levelState.progress.toString());
                                return Container(
                                  // color: Colors.blue,
                                  child: Image.asset(levelState.checkDropped('chocolate_swiss')
                                    ? 'assets/images/foods/Chocolate_Swiss.gif'
                                    : 'assets/images/foods/transparent_square.png')
                                );
                              },
                              onWillAccept: (data) {
                                return data == 'chocolate_swiss';
                              },
                              onAccept: (data) {
                                levelState.setProgress('chocolate_swiss');
                                levelState.evaluate();
                                debugPrint(levelState.progress.toString());
                              },
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment(-0.66, -0.33),
                          child: FractionallySizedBox(
                            widthFactor: 0.25,
                            heightFactor: 0.25,
                            child: DragTarget<String>(
                              builder: (
                                BuildContext context,
                                List<dynamic> accepted,
                                List<dynamic> rejected,
                              ) {
                                debugPrint(levelState.progress.toString());
                                return Container(
                                  // color: Colors.blue,
                                  child: Image.asset(levelState.checkDropped('grape_swiss')
                                    ? 'assets/images/foods/Grape_Swiss.gif'
                                    : 'assets/images/foods/transparent_square.png')
                                );
                              },
                              onWillAccept: (data) {
                                return data == 'grape_swiss';
                              },
                              onAccept: (data) {
                                levelState.setProgress('grape_swiss');
                                levelState.evaluate();
                                debugPrint(levelState.progress.toString());
                              },
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment(0.66, -0.33),
                          child: FractionallySizedBox(
                            widthFactor: 0.25,
                            heightFactor: 0.25,
                            child: DragTarget<String>(
                              builder: (
                                BuildContext context,
                                List<dynamic> accepted,
                                List<dynamic> rejected,
                              ) {
                                debugPrint(levelState.progress.toString());
                                return Container(
                                  // color: Colors.blue,
                                  child: Image.asset(levelState.checkDropped('orange_swiss')
                                    ? 'assets/images/foods/Orange_Swiss.gif'
                                    : 'assets/images/foods/transparent_square.png')
                                );
                              },
                              onWillAccept: (data) {
                                return data == 'orange_swiss';
                              },
                              onAccept: (data) {
                                levelState.setProgress('orange_swiss');
                                levelState.evaluate();
                                debugPrint(levelState.progress.toString());
                              },
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment(0, 0.66),
                          child: FractionallySizedBox(
                            widthFactor: 0.25,
                            heightFactor: 0.25,
                            child: DragTarget<String>(
                              builder: (
                                BuildContext context,
                                List<dynamic> accepted,
                                List<dynamic> rejected,
                              ) {
                                debugPrint(levelState.progress.toString());
                                return Container(
                                  // color: Colors.blue,
                                  child: Image.asset(levelState.checkDropped('lime_swiss')
                                    ? 'assets/images/foods/Lime_Swiss.gif'
                                    : 'assets/images/foods/transparent_square.png')
                                );
                              },
                              onWillAccept: (data) {
                                return data == 'lime_swiss';
                              },
                              onAccept: (data) {
                                levelState.setProgress('lime_swiss');
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
                flex: 1,
                child: Center(
                  child: AspectRatio(
                    aspectRatio: 1/2,
                    child: Stack (
                      children: [
                        Container(
                          alignment: Alignment.topCenter,
                          child: FractionallySizedBox(
                            heightFactor: 0.25,
                            child: Container(
                              // color: Colors.black12,
                              child: LayoutBuilder(
                                builder: (context, constraints) => Visibility(
                                  visible: !levelState.checkDropped('chocolate_swiss'),
                                  child: Draggable<String>(
                                    data: 'chocolate_swiss',
                                    feedback: Container(
                                      width: constraints.maxWidth*0.525,
                                      child: Food(
                                      name: 'chocolate_swiss',
                                      relativeWidth: 0.5,
                                      relativeHeight: 0.5,
                                      sprite: Image.asset('assets/images/foods/Chocolate_Swiss.gif')
                                    )),
                                    childWhenDragging: Container(),
                                    child: Food(
                                      name: 'chocolate_swiss',
                                      relativeWidth: 0.5,
                                      relativeHeight: 0.5,
                                      sprite: Image.asset('assets/images/foods/Chocolate_Swiss.gif')
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.bottomCenter,
                          child: FractionallySizedBox(
                            heightFactor: 0.25,
                            child: Container(
                              // color: Colors.black12,
                              child: LayoutBuilder(
                                builder: (context, constraints) => Visibility(
                                  visible: !levelState.checkDropped('grape_swiss'),
                                  child: Draggable<String>(
                                    data: 'grape_swiss',
                                    feedback: Container(
                                      width: constraints.maxWidth*0.525,
                                      child: Food(
                                      name: 'grape_swiss',
                                      relativeWidth: 0.5,
                                      relativeHeight: 0.5,
                                      sprite: Image.asset('assets/images/foods/Grape_Swiss.gif')
                                    )),
                                    childWhenDragging: Container(),
                                    child: Food(
                                      name: 'grape_swiss',
                                      relativeWidth: 0.5,
                                      relativeHeight: 0.5,
                                      sprite: Image.asset('assets/images/foods/Grape_Swiss.gif')
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
