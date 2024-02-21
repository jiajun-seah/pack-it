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
      backgroundColor: palette.mediumBeige,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/images/title/title_background_animated.png'),
              fit: BoxFit.cover),),
          ),
          // Container(
          //   decoration: const BoxDecoration(
          //     image: DecorationImage(image: AssetImage('assets/images/title/falling_leaf.gif'),
          //     fit: BoxFit.cover),),
          // ),
          
          ResponsiveScreen(
          squarishMainArea: Row(
            children: [
              Flexible(flex:2, child: Container(),),
              Flexible(
                flex: 1,
                child: Center(
                  child: Image.asset('assets/images/title/pack_it_logo_cropped.png')),
              ),
        
              ],
          ),
          rectangularMenuArea: Row(
            children: [
              Flexible(flex: 3, child: Container()),
              Flexible(
                flex:1,
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      audioController.playSfx(SfxType.peel);
                      GoRouter.of(context).go('/play');
                    },
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
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
                        fontWeight: FontWeight.w600,
                        fontSize: 48,
                    ),),
                  ),
                  _gap,
                  TextButton(
                    onPressed: () {
                      audioController.playSfx(SfxType.peel);
                      GoRouter.of(context).go('/settings');
                    },
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
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
                        fontWeight: FontWeight.w600,
                        fontSize: 32,
                    ),),
                  ),
                  _gap,
                  TextButton(
                    onPressed: () {
                      audioController.playSfx(SfxType.peel);
                      GoRouter.of(context).go('/extras');
                    },
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
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
                        fontWeight: FontWeight.w600,
                        fontSize: 32,
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
              )
            ],
          ),
        ),]
      ),
    );
  }
  static const _gap = SizedBox(height: 20);
}