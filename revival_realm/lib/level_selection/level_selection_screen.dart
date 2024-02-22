import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../audio/audio_controller.dart';
import '../audio/sounds.dart';
import '../player_progress/player_progress.dart';
import '../style/palette.dart';
import 'levels.dart';

class LevelSelectionScreen extends StatelessWidget {
  const LevelSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();
    final playerProgress = context.watch<PlayerProgress>();
    final audioController = context.watch<AudioController>();

    return Scaffold(
      backgroundColor: palette.lightBeige,
      body: Stack(
        children: [Container(
            decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/images/title/simple_background.png'),
              fit: BoxFit.cover),),
          ),
          Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Select Level',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.outfit(
                        fontSize: 55,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 50),
            Expanded(
              child: FractionallySizedBox(
                widthFactor: 3/5,
                child: GridView.builder(
                  itemCount: gameLevels.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
                  itemBuilder: (context, index) => TextButton(
                    
                    onPressed: playerProgress.highestLevelReached >= index?(){
                      GoRouter.of(context).go('/play/session/${(index+1)}');
                      audioController.playSfx(SfxType.peel);
                      } : null,
                    style: ButtonStyle(
                      foregroundColor: playerProgress.highestLevelReached >= index? MaterialStateProperty.all<Color>(Colors.black): MaterialStateProperty.all<Color>(Colors.grey.shade600),
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                      padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(14)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          side: const BorderSide(color: Colors.transparent)
                        )
                      )
                    ),
                    child: Stack(
                      children: [
                        Opacity(
                          opacity: 0.9,
                          child: Image.asset(playerProgress.highestLevelReached > index ?
                                        'assets/images/foods/level_${(index+1)}_lid.png':
                                        playerProgress.highestLevelReached == index ?
                                        'assets/images/foods/styrofoam_open.png':
                                         'assets/images/foods/styrofoam_closed.png'),
                        ),
                        Text(
                          (index+1).toString(),
                          textAlign: TextAlign.center,
                          style: GoogleFonts.outfit(
                            fontSize: 32,
                          ),
                        ),
                      ]
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
        ),]
      ),
    );
  }
}