import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// import '../audio/audio_controller.dart';
// import '../audio/sounds.dart';
import '../game_internals/level_state.dart';
import '../level_selection/levels.dart';

/// This widget defines the game UI itself, without things like the settings
/// button or the back button.
class GameWidget extends StatelessWidget {
  const GameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final level = context.watch<GameLevel>();
    final levelState = context.watch<LevelState>();

    return Column(
      children: [
        // Text('Level ${level.number}'),
        SizedBox(
          width: 500,
          height: 500,
          child: GridView.builder(
          itemCount: 25,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
          itemBuilder: ((context, index) => Center(
            child: Text(
              index.toString(),
              style: TextStyle(color: Colors.black),
            ))
          )
        ),
        )
        // Slider(
        //   label: 'Level Progress',
        //   autofocus: true,
        //   value: levelState.progress / 100,
        //   onChanged: (value) => levelState.setProgress((value * 100).round()),
        //   onChangeEnd: (value) {
        //     // context.read<AudioController>().playSfx(SfxType.wssh);
        //     levelState.evaluate();
        //   },
        // )
      ],
    );
  }
}
