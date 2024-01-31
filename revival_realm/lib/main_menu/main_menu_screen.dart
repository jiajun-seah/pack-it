// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../audio/audio_controller.dart';
import '../audio/sounds.dart';
// import '../settings/settings.dart';
import '../style/my_button.dart';
import '../style/palette.dart';
import '../style/responsive_screen.dart';

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();
    // final settingsController = context.watch<SettingsController>();
    final audioController = context.watch<AudioController>();

    return Scaffold(
      backgroundColor: palette.backgroundMain,
      body: ResponsiveScreen(
        squarishMainArea: const Center(
          child: Text(
              'Revival',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Halogen',
                fontSize: 100,
                height: 1,
              ),
            ),
        ),
        rectangularMenuArea: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyButton(
              onPressed: () {
                audioController.playSfx(SfxType.buttonTap);
                GoRouter.of(context).go('/play');
              },
              child: const Text('Play'),
            ),
            _gap,
            MyButton(
              onPressed: () => GoRouter.of(context).push('/settings'),
              child: const Text('Options'),
            ),
            _gap,
            MyButton(
              onPressed: () => GoRouter.of(context).push('/collection'),
              child: const Text('Collection'),
            ),
            _gap,
            MyButton(
              onPressed: () => GoRouter.of(context).push('/quit'),
              child: const Text('Quit'),
            ),
          ],
        ),
      ),
    );
  }

  static const _gap = SizedBox(height: 10);
}