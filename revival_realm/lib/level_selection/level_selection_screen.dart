// import 'package:revival_realm/level_selection/instructions_dialog.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:nes_ui/nes_ui.dart';
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
    final audioController = context.watch<AudioController>();
    final levelTextStyle =
        Theme.of(context).textTheme.bodyMedium?.copyWith(height: 1.4);

    return Scaffold(
      backgroundColor: palette.darkEarthGreen,
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
                  // const SizedBox(width: 16),
                  // NesButton(
                  //   type: NesButtonType.normal,
                  //   child: NesIcon(iconData: NesIcons.questionMark),
                  //   onPressed: () {
                  //     NesDialog.show(
                  //       context: context,
                  //       builder: (_) => const InstructionsDialog(),
                  //     );
                  //   },
                  // )
                ],
              ),
            ),
          ),
          const SizedBox(height: 50),
          Expanded(
            child: SizedBox(
              width: 500,
              child: GridView.builder(
                itemCount: gameLevels.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
                itemBuilder: (context, index) => ListTile(
                  enabled: playerProgress.highestLevelReached >=
                          index,
                  onTap:(){
                    GoRouter.of(context).go('/play/session/${(index+1)}');
                    audioController.playSfx(SfxType.peel);
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
          // MyButton(
          //   onPressed: () {
          //     GoRouter.of(context).go('/');
          //     audioController.playSfx(SfxType.peel);
              
          //   },
          //   child: const Text('Back'),
          // ),
          ElevatedButton(
              onPressed: () {
                audioController.playSfx(SfxType.peel);
                GoRouter.of(context).go('/');
              },
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(14)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0),
                    side: const BorderSide(color: Colors.transparent)
                  )
                )
              ),
              child: Text(
                'Back',
                textAlign: TextAlign.center,
                style: GoogleFonts.outfit(
                  fontSize: 28,
              ),),
            ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}