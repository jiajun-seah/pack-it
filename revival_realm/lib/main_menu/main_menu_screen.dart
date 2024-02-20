import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../audio/audio_controller.dart';
import '../audio/sounds.dart';
import '../settings/settings.dart';
// import '../style/my_button.dart';
import '../style/palette.dart';
import '../style/responsive_screen_landscape.dart';

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();
    final settingsController = context.watch<SettingsController>();
    final audioController = context.watch<AudioController>();

    return Scaffold(
      backgroundColor: palette.lightEarthGreen,
      body: ResponsiveScreen(
        squarishMainArea: const Center(
          child: Text(
              'Pack-It!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Halogen',
                fontSize: 200,
                // height: 1,
              ),
            ),
        ),
        rectangularMenuArea: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                audioController.playSfx(SfxType.peel);
                GoRouter.of(context).go('/play');
              },
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(14)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    side: const BorderSide(color: Colors.transparent)
                  )
                )
              ),
              child: Text(
                'Play',
                textAlign: TextAlign.center,
                style: GoogleFonts.outfit(
                  fontSize: 28,
              ),),
            ),
            _gap,
            TextButton(
              onPressed: () {
                audioController.playSfx(SfxType.peel);
                GoRouter.of(context).go('/settings');
              },
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(14)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    side: const BorderSide(color: Colors.transparent)
                  )
                )
              ),
              child: Text(
                'Settings',
                textAlign: TextAlign.center,
                style: GoogleFonts.outfit(
                  fontSize: 28,
              ),),
            ),
            _gap,
            TextButton(
              onPressed: () {
                audioController.playSfx(SfxType.peel);
                GoRouter.of(context).go('/extras');
              },
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(14)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    side: const BorderSide(color: Colors.transparent)
                  )
                )
              ),
              child: Text(
                'Extras',
                textAlign: TextAlign.center,
                style: GoogleFonts.outfit(
                  fontSize: 28,
              ),),
            ),
            
            Padding(
              padding: const EdgeInsets.only(top: 32),
              child: ValueListenableBuilder<bool>(
                valueListenable: settingsController.audioOn,
                builder: (context, audioOn, child) {
                  return IconButton(
                    onPressed: () => settingsController.toggleAudioOn(),
                    icon: Icon(audioOn ? Icons.volume_up : Icons.volume_off),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
  static const _gap = SizedBox(height: 20);
}