import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';


import '../audio/audio_controller.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../audio/sounds.dart';
import '../player_progress/player_progress.dart';
import '../style/palette.dart';
import '../style/responsive_screen_landscape.dart';

import 'settings.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  static const _gap = SizedBox(height: 60);

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<SettingsController>();
    final palette = context.watch<Palette>();
    final audioController = context.watch<AudioController>();

    return Scaffold(
      backgroundColor: palette.lightBeige,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/images/title/simple_background.png'),
              fit: BoxFit.cover),),
          ),
          ResponsiveScreen(
          squarishMainArea: Column(
            children: [
              Flexible(flex:1, child: Container(),),
              Flexible(
                flex:1,
                child: AutoSizeText(
                  'Settings',
                  minFontSize: 38,
                  // maxFontSize: 55,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.outfit(
                    fontSize: 55,
                    fontWeight: FontWeight.w700
                  ),
                ),
              ),
              Flexible(flex:1, child: Container(),),
              Flexible(
                flex:1,
                child: Row(
                  children: [
                    Expanded(
                      flex:2,
                      child: AutoSizeText(
                        'Music Volume',
                        minFontSize: 24,
                        // maxFontSize: 55,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.right,
                        maxLines: 2,
                        style: GoogleFonts.outfit(
                          fontSize: 32,
                          // fontWeight: FontWeight.w700
                        ),
                      ),
                    ),
                    Flexible(
                      flex:1,
                      child: Container()
                    ),
                    Flexible(
                      flex: 7,
                      child: ValueListenableBuilder<double>(
                        valueListenable: settings.musicVolume,
                        builder: (context, musicVolume, child) =>
                        Slider.adaptive(value: musicVolume, onChanged: (value) => settings.setMusicVolume(value))
                      ),
                    ),
                  ]
                ),
              ),
              Flexible(
                flex: 1,
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: AutoSizeText(
                        'SFX Volume',
                        minFontSize: 24,
                        // maxFontSize: 55,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.right,
                        maxLines: 2,
                        style: GoogleFonts.outfit(
                          fontSize: 32,
                          // fontWeight: FontWeight.w700
                        ),
                      ),
                    ),
                    Flexible(
                      flex:1,
                      child: Container()
                    ),
                    Flexible(
                      flex: 7,
                      child: ValueListenableBuilder<double>(
                        valueListenable: settings.soundsVolume,
                        builder: (context, soundsVolume, child) =>
                         Slider.adaptive(value: soundsVolume, onChanged: (value) => settings.setSoundsVolume(value))
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                flex:1,
                child: TextButton(
                  onPressed: () {
                    context.read<PlayerProgress>().reset();
                     final messenger = ScaffoldMessenger.of(context);
                    messenger.showSnackBar(
                      const SnackBar(
                          content: Text('Your progress has been reset')),);
                  },
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.redAccent.shade700),
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                    padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(14)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        side: const BorderSide(color: Colors.transparent)
                      )
                    )
                  ),
                  child: AutoSizeText(
                        'Reset Progress',
                        minFontSize: 20,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        style: GoogleFonts.outfit(
                          fontSize: 28,
                          // fontWeight: FontWeight.w700
                        ),
                      ),
                ),
              ),
              // _SettingsLine(
              //   'Reset progress',
              //   const Icon(Icons.delete),
              //   onSelected: () {
              //     context.read<PlayerProgress>().reset();
        
              //     final messenger = ScaffoldMessenger.of(context);
              //     messenger.showSnackBar(
              //       const SnackBar(
              //           content: Text('Player progress has been reset.')),
              //     );
              //   },
              // ),
              _gap,
            ],
          ),
          rectangularMenuArea: 
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
                  child: AutoSizeText(
                        'Back',
                        minFontSize: 20,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        style: GoogleFonts.outfit(
                          fontSize: 28,
                          // fontWeight: FontWeight.w700
                        ),
                      ),
                ),
        ),]
      ),
    );
  }
}
class _SettingsLine extends StatelessWidget {
  final String title;

  final Widget icon;

  final VoidCallback? onSelected;

  const _SettingsLine(this.title, this.icon, {this.onSelected});

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      highlightShape: BoxShape.rectangle,
      onTap: onSelected,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontFamily: 'Permanent Marker',
                  fontSize: 30,
                ),
              ),
            ),
            icon,
          ],
        ),
      ),
    );
  }
}