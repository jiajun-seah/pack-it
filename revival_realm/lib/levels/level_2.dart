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
class LevelTwo extends StatelessWidget {
  const LevelTwo({super.key});

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
                    aspectRatio: 1/1,
                    child: Stack (
                      children: [
                        Container(
                          alignment: Alignment.topCenter,
                          child: FractionallySizedBox(
                            // heightFactor: 0.5,
                            child: Container(
                              color: Colors.black12,
                              child: LayoutBuilder(
                                builder: (context, constraints) => Visibility(
                                  visible: !levelState.checkDropped('banana'),
                                  child: Draggable<String>(
                                    data: 'banana',
                                    feedback: Container(
                                      width: constraints.maxWidth*1.05,
                                      child: Food(
                                      name: 'banana',
                                      relativeWidth: 1.0,
                                      relativeHeight: 0.5,
                                      sprite: Image.asset('assets/images/foods/Banana.gif')
                                    )),
                                    childWhenDragging: Container(),
                                    child: Food(
                                      name: 'banana',
                                      relativeWidth: 1.0,
                                      relativeHeight: 0.5,
                                      sprite: Image.asset('assets/images/foods/Banana.gif')
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
                            heightFactor: 0.5,
                            child: Container(
                              color: Colors.black12,
                              child: LayoutBuilder(
                                builder: (context, constraints) => Visibility(
                                  visible: !levelState.checkDropped('orange_r'),
                                  child: Draggable<String>(
                                    data: 'orange_r',
                                    feedback: Container(
                                      width: constraints.maxWidth*0.55,
                                      child: Food(
                                      name: 'orange_r',
                                      relativeWidth: 0.5,
                                      relativeHeight: 0.5,
                                      sprite: Image.asset('assets/images/foods/Orange_r.gif')
                                    )),
                                    childWhenDragging: Container(),
                                    child: Food(
                                      name: 'orange_r',
                                      relativeWidth: 0.5,
                                      relativeHeight: 0.5,
                                      sprite: Image.asset('assets/images/foods/Orange_r.gif')
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
                flex:1,
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
                            child: DragTarget<String>(
                              builder: (
                                BuildContext context,
                                List<dynamic> accepted,
                                List<dynamic> rejected,
                              ) {
                                debugPrint(levelState.progress.toString());
                                return Container(
                                  // color: Colors.blue,
                                  child: Image.asset(levelState.checkDropped('orange_l')
                                    ? 'assets/images/foods/Orange_L.gif'
                                    : 'assets/images/foods/Grey_L.png')
                                );
                              },
                              onWillAccept: (data) {
                                return data == 'orange_l';
                              },
                              onAccept: (data) {
                                levelState.setProgress('orange_l');
                                levelState.evaluate();
                                debugPrint(levelState.progress.toString());
                              },
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.topRight,
                          child: FractionallySizedBox(
                            widthFactor: 0.5,
                            heightFactor: 0.5,
                            child: DragTarget<String>(
                              builder: (
                                BuildContext context,
                                List<dynamic> accepted,
                                List<dynamic> rejected,
                              ) {
                                debugPrint(levelState.progress.toString());
                                return Container(
                                  // color: Colors.blue,
                                  child: Image.asset(levelState.checkDropped('orange_r')
                                    ? 'assets/images/foods/Orange_R.gif'
                                    : 'assets/images/foods/Grey_L.png')
                                );
                              },
                              onWillAccept: (data) {
                                return data == 'orange_r';
                              },
                              onAccept: (data) {
                                levelState.setProgress('orange_r');
                                levelState.evaluate();
                                debugPrint(levelState.progress.toString());
                              },
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.bottomLeft,
                          child: FractionallySizedBox(
                            widthFactor: 1,
                            heightFactor: 0.5,
                            child: DragTarget<String>(
                              builder: (
                                BuildContext context,
                                List<dynamic> accepted,
                                List<dynamic> rejected,
                              ) {
                                debugPrint(levelState.progress.toString());
                                return Container(
                                  // color: Colors.blue,
                                  child: Image.asset(levelState.checkDropped('banana')
                                    ? 'assets/images/foods/Banana.gif'
                                    : 'assets/images/foods/Grey_L.png')
                                );
                              },
                              onWillAccept: (data) {
                                return data == 'banana';
                              },
                              onAccept: (data) {
                                levelState.setProgress('banana');
                                levelState.evaluate();
                                debugPrint(levelState.progress.toString());
                              },
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment(0.0, 0.25),
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
                                  child: Image.asset(levelState.checkDropped('blueberry')
                                    ? 'assets/images/foods/Blueberry.gif'
                                    : 'assets/images/foods/Grey_L.png')
                                );
                              },
                              onWillAccept: (data) {
                                return data == 'blueberry';
                              },
                              onAccept: (data) {
                                levelState.setProgress('blueberry');
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
                            heightFactor: 0.5,
                            child: Container(
                              color: Colors.black12,
                              child: LayoutBuilder(
                                builder: (context, constraints) => Visibility(
                                  visible: !levelState.checkDropped('orange_l'),
                                  child: Draggable<String>(
                                    data: 'orange_l',
                                    feedback: Container(
                                      width: constraints.maxWidth,
                                      child: Food(
                                      name: 'orange_l',
                                      relativeWidth: 0.5,
                                      relativeHeight: 0.5,
                                      sprite: Image.asset('assets/images/foods/Orange_l.gif')
                                    )),
                                    childWhenDragging: Container(),
                                    child: Food(
                                      name: 'orange_l',
                                      relativeWidth: 0.5,
                                      relativeHeight: 0.5,
                                      sprite: Image.asset('assets/images/foods/Orange_l.gif')
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
                            heightFactor: 0.2,
                            child: Container(
                              color: Colors.black12,
                              child: LayoutBuilder(
                                builder: (context, constraints) => Visibility(
                                  visible: !levelState.checkDropped('blueberry'),
                                  child: Draggable<String>(
                                    data: 'blueberry',
                                    feedback: Container(
                                      width: constraints.maxWidth*.45,
                                      child: Food(
                                      name: 'blueberry',
                                      relativeWidth: 0.5,
                                      relativeHeight: 0.5,
                                      sprite: Image.asset('assets/images/foods/blueberry.gif')
                                    )),
                                    childWhenDragging: Container(),
                                    child: Food(
                                      name: 'blueberry',
                                      relativeWidth: 0.5,
                                      relativeHeight: 0.5,
                                      sprite: Image.asset('assets/images/foods/blueberry.gif')
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