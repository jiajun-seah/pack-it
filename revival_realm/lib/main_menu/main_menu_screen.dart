// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../audio/audio_controller.dart';
import '../audio/sounds.dart';
import '../settings/settings.dart';
import '../style/my_button.dart';
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
            ElevatedButton(
              onPressed: () {
                audioController.playSfx(SfxType.peel);
                GoRouter.of(context).go('/play');
              },
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(20)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.0),
                    side: const BorderSide(color: Colors.red)
                  )
                )
              ),
              child: const Text(
                'Play',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
              ),),
            ),
            _gap,
            MyButton(
              onPressed: () => GoRouter.of(context).push('/settings'),
              child: const Text(
                'Options',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
              ),),
            ),
            _gap,
            MyButton(
              onPressed: () => GoRouter.of(context).push('/extras'),
              child: const Text(
                'Extras',
                textAlign: TextAlign.center,
                style: TextStyle(
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