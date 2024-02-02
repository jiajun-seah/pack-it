import 'package:revival_realm/level_selection/instructions_dialog.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nes_ui/nes_ui.dart';
import 'package:provider/provider.dart';

import '../audio/audio_controller.dart';
import '../audio/sounds.dart';
import '../player_progress/player_progress.dart';
import '../style/my_button.dart';
import '../style/palette.dart';
import 'levels.dart';

class LevelSelectionScreen extends StatelessWidget {
  const LevelSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();
    final playerProgress = context.watch<PlayerProgress>();
    final levelTextStyle =
        Theme.of(context).textTheme.bodyMedium?.copyWith(height: 1.4);

    return Scaffold(
      backgroundColor: palette.backgroundLevelSelection,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Select level',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(width: 16),
                  NesButton(
                    type: NesButtonType.normal,
                    child: NesIcon(iconData: NesIcons.questionMark),
                    onPressed: () {
                      NesDialog.show(
                        context: context,
                        builder: (_) => const InstructionsDialog(),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 50),
          Expanded(
            child: SizedBox(
              width: 450,
              child: GridView.builder(
                itemCount: gameLevels.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
                itemBuilder: (context, index) => ListTile(
                  enabled: true,
                  onTap:(){
                    GoRouter.of(context).go('/play/session/${(index+1)}');
                  },
                  leading: Text(
                    (index+1).toString(),
                    style: levelTextStyle,
                  )
                )
              ),
            ),
          ),
          const SizedBox(height: 30),
          MyButton(
            onPressed: () {
              GoRouter.of(context).go('/');
            },
            child: const Text('Back'),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}