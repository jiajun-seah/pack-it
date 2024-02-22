import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';


import '../audio/audio_controller.dart';
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
              _gap,
              Text(
                'Settings',
                textAlign: TextAlign.center,
                style: GoogleFonts.outfit(
                  fontSize: 55,
                  fontWeight: FontWeight.w700
                ),
              ),
              _gap,
              Row(
                children: [
                  Expanded(
                    flex:2,
                    child: Text(
                      'Music Volume',
                      textAlign: TextAlign.right,
                      style: GoogleFonts.outfit(
                        fontSize: 36,
                      ),
                    ),
                  ),
                  Flexible(
                    flex:1,
                    child: Container()
                  ),
                  Flexible(
                    flex: 8,
                    child: ValueListenableBuilder<double>(
                      valueListenable: settings.musicVolume,
                      builder: (context, musicVolume, child) =>
                      Slider.adaptive(value: musicVolume, onChanged: (value) => settings.setMusicVolume(value))
                    ),
                  ),
                ]
              ),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      'SFX Volume',
                      textAlign: TextAlign.right,
                      style: GoogleFonts.outfit(
                        fontSize: 36,
                      ),
                    ),
                  ),
                  Flexible(
                    flex:1,
                    child: Container()
                  ),
                  Flexible(
                    flex: 8,
                    child: ValueListenableBuilder<double>(
                      valueListenable: settings.soundsVolume,
                      builder: (context, soundsVolume, child) =>
                       Slider.adaptive(value: soundsVolume, onChanged: (value) => settings.setSoundsVolume(value))
                    ),
                  ),
                ],
              ),
              TextButton(
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
                child: Text(
                  'Reset progress',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.outfit(
                    fontSize: 28,
                ),),
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
                  child: Text(
                    'Back',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.outfit(
                      fontSize: 28,
                  ),),
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