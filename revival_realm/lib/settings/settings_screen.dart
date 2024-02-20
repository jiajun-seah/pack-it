// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../player_progress/player_progress.dart';
import '../style/my_button.dart';
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

    return Scaffold(
      backgroundColor: palette.lightEarthGreen,
      body: ResponsiveScreen(
        squarishMainArea: Column(
          children: [
            _gap,
            Text(
              'Settings',
              textAlign: TextAlign.center,
              style: GoogleFonts.outfit(
                fontSize: 55,
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
            // _gap,
          ],
        ),
        rectangularMenuArea: MyButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          child: const Text('Back'),
        ),
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