import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// import '../audio/audio_controller.dart';
// import '../audio/sounds.dart';
import '../game_internals/level_state.dart';
import '../level_selection/levels.dart';
import 'pixel.dart';
import 'recyclable_mapping.dart';
import 'piece.dart';

/// This widget defines the game UI itself, without things like the settings
/// button or the back button.
class GameWidget extends StatelessWidget {
  const GameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final level = context.watch<GameLevel>();
    final levelState = context.watch<LevelState>();

    return SingleChildScrollView(
      child: Column(
        children: [
          Text('Level ${level.number}'),
          Row(children: [
            Expanded(
              flex:1,
              child:
                SizedBox(
                  height: 500,
                  child: Container(
                    color: Colors.black12,
                    child: Column(
                      children: [
                        Draggable<String>(
                          data: 'A',
                          child: Piece(type:Recyclable.A),
                          feedback: Piece(type:Recyclable.A),
                          childWhenDragging: Container(),)],
                        ),
                  ),
                ),
            ),
            Flexible(
              fit: FlexFit.loose,
              child: SizedBox(
                width: 500,
                height: 500,
                child: GridView.builder(
                  itemCount: level.size*level.size,
                  // shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: level.size),
                  itemBuilder: ((context, index) => Center(
                    child: Pixel(
                      color: Colors.black12,
                      child: index,
                      ),
                  )),
                ),
              ),
            ),
            Expanded(
              flex:1,
              child:
                SizedBox(
                  height: 500,
                  child: Container(
                    color: Colors.black12,
                  ),
                ),
            ),
          ],)
        ],
      ),
    );
  }
}
