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
class LevelSix extends StatelessWidget {
  const LevelSix({super.key});

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
                          alignment: Alignment.topLeft,
                          child: FractionallySizedBox(
                            heightFactor: 0.333,
                            child: Container(
                              // color: Colors.black12,
                              child: LayoutBuilder(
                                builder: (context, constraints) => Visibility(
                                  visible: !levelState.checkDropped('chocolate_sprinkle'),
                                  child: Draggable<String>(
                                    data: 'chocolate_sprinkle',
                                    feedback: Container(
                                      width: constraints.maxWidth*0.7,
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
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          child: FractionallySizedBox(
                            heightFactor: 0.333,
                            child: Container(
                              // color: Colors.black12,
                              child: LayoutBuilder(
                                builder: (context, constraints) => Visibility(
                                  visible: !levelState.checkDropped('vanilla_glazed'),
                                  child: Draggable<String>(
                                    data: 'vanilla_glazed',
                                    feedback: Container(
                                      width: constraints.maxWidth*0.7,
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
                        ),
                        Container(
                          alignment: Alignment.bottomLeft,
                          child: FractionallySizedBox(
                            heightFactor: 0.333,
                            child: Container(
                              // color: Colors.black12,
                              child: LayoutBuilder(
                                builder: (context, constraints) => Visibility(
                                  visible: !levelState.checkDropped('strawberry_swirl'),
                                  child: Draggable<String>(
                                    data: 'strawberry_swirl',
                                    feedback: Container(
                                      width: constraints.maxWidth*0.7,
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
                            widthFactor: 0.333,
                            heightFactor: 0.333,
                            child: DragTarget<String>(
                              builder: (
                                BuildContext context,
                                List<dynamic> accepted,
                                List<dynamic> rejected,
                              ) {
                                debugPrint(levelState.progress.toString());
                                return Container(
                                  // color: Colors.blue,
                                  child: Image.asset(levelState.checkDropped('vanilla_glazed')
                                    ? 'assets/images/foods/Vanilla_Glazed.gif'
                                    : 'assets/images/foods/Grey_L.png')
                                );
                              },
                              onWillAccept: (data) {
                                return data == 'vanilla_glazed';
                              },
                              onAccept: (data) {
                                levelState.setProgress('vanilla_glazed');
                                levelState.evaluate();
                                debugPrint(levelState.progress.toString());
                              },
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: FractionallySizedBox(
                            widthFactor: 0.333,
                            heightFactor: 0.333,
                            child: DragTarget<String>(
                              builder: (
                                BuildContext context,
                                List<dynamic> accepted,
                                List<dynamic> rejected,
                              ) {
                                debugPrint(levelState.progress.toString());
                                return Container(
                                  // color: Colors.blue,
                                  child: Image.asset(levelState.checkDropped('chocolate_sprinkle')
                                    ? 'assets/images/foods/Chocolate_Sprinkle.gif'
                                    : 'assets/images/foods/Grey_L.png')
                                );
                              },
                              onWillAccept: (data) {
                                return data == 'chocolate_sprinkle';
                              },
                              onAccept: (data) {
                                levelState.setProgress('chocolate_sprinkle');
                                levelState.evaluate();
                                debugPrint(levelState.progress.toString());
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
                                debugPrint(levelState.progress.toString());
                                return Container(
                                  // color: Colors.blue,
                                  child: Image.asset(levelState.checkDropped('chocolate_swirl')
                                    ? 'assets/images/foods/chocolate_swirl.gif'
                                    : 'assets/images/foods/Grey_L.png')
                                );
                              },
                              onWillAccept: (data) {
                                return data == 'chocolate_swirl';
                              },
                              onAccept: (data) {
                                levelState.setProgress('chocolate_swirl');
                                levelState.evaluate();
                                debugPrint(levelState.progress.toString());
                              },
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.bottomLeft,
                          child: FractionallySizedBox(
                            widthFactor: 0.333,
                            heightFactor: 0.333,
                            child: DragTarget<String>(
                              builder: (
                                BuildContext context,
                                List<dynamic> accepted,
                                List<dynamic> rejected,
                              ) {
                                debugPrint(levelState.progress.toString());
                                return Container(
                                  // color: Colors.blue,
                                  child: Image.asset(levelState.checkDropped('strawberry_glazed')
                                    ? 'assets/images/foods/Strawberry_Glazed.gif'
                                    : 'assets/images/foods/Grey_L.png')
                                );
                              },
                              onWillAccept: (data) {
                                return data == 'strawberry_glazed';
                              },
                              onAccept: (data) {
                                levelState.setProgress('strawberry_glazed');
                                levelState.evaluate();
                                debugPrint(levelState.progress.toString());
                              },
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.bottomCenter,
                          child: FractionallySizedBox(
                            widthFactor: 0.333,
                            heightFactor: 0.333,
                            child: DragTarget<String>(
                              builder: (
                                BuildContext context,
                                List<dynamic> accepted,
                                List<dynamic> rejected,
                              ) {
                                debugPrint(levelState.progress.toString());
                                return Container(
                                  // color: Colors.blue,
                                  child: Image.asset(levelState.checkDropped('strawberry_sprinkle')
                                    ? 'assets/images/foods/Strawberry_Sprinkle.gif'
                                    : 'assets/images/foods/Grey_L.png')
                                );
                              },
                              onWillAccept: (data) {
                                return data == 'strawberry_sprinkle';
                              },
                              onAccept: (data) {
                                levelState.setProgress('strawberry_sprinkle');
                                levelState.evaluate();
                                debugPrint(levelState.progress.toString());
                              },
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.bottomRight,
                          child: FractionallySizedBox(
                            widthFactor: 0.333,
                            heightFactor: 0.333,
                            child: DragTarget<String>(
                              builder: (
                                BuildContext context,
                                List<dynamic> accepted,
                                List<dynamic> rejected,
                              ) {
                                debugPrint(levelState.progress.toString());
                                return Container(
                                  // color: Colors.blue,
                                  child: Image.asset(levelState.checkDropped('strawberry_swirl')
                                    ? 'assets/images/foods/Strawberry_Swirl.gif'
                                    : 'assets/images/foods/Grey_L.png')
                                );
                              },
                              onWillAccept: (data) {
                                return data == 'strawberry_swirl';
                              },
                              onAccept: (data) {
                                levelState.setProgress('strawberry_swirl');
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
                          alignment: Alignment.topRight,
                          child: FractionallySizedBox(
                            heightFactor: 0.333,
                            child: Container(
                              // color: Colors.black12,
                              child: LayoutBuilder(
                                builder: (context, constraints) => Visibility(
                                  visible: !levelState.checkDropped('strawberry_glazed'),
                                  child: Draggable<String>(
                                    data: 'strawberry_glazed',
                                    feedback: Container(
                                      width: constraints.maxWidth*0.7,
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
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: FractionallySizedBox(
                            heightFactor: 0.333,
                            child: Container(
                              // color: Colors.black12,
                              child: LayoutBuilder(
                                builder: (context, constraints) => Visibility(
                                  visible: !levelState.checkDropped('strawberry_sprinkle'),
                                  child: Draggable<String>(
                                    data: 'strawberry_sprinkle',
                                    feedback: Container(
                                      width: constraints.maxWidth*0.7,
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
                        ),
                        Container(
                          alignment: Alignment.bottomRight,
                          child: FractionallySizedBox(
                            heightFactor: 0.333,
                            child: Container(
                              // color: Colors.black12,
                              child: LayoutBuilder(
                                builder: (context, constraints) => Visibility(
                                  visible: !levelState.checkDropped('chocolate_swirl'),
                                  child: Draggable<String>(
                                    data: 'chocolate_swirl',
                                    feedback: Container(
                                      width: constraints.maxWidth*0.7,
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
