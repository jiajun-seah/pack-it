import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../game_internals/score.dart';
import '../style/my_button.dart';
import '../style/palette.dart';
import '../style/responsive_screen_landscape.dart';

class WinGameScreen extends StatelessWidget {
  final Score score;

  const WinGameScreen({
    super.key,
    required this.score,
  });

  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();

    const gap = SizedBox(height: 10);

    return Scaffold(
      backgroundColor: palette.backgroundPlaySession,
      body: ResponsiveScreen(
        squarishMainArea: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            gap,
            const Center(
              child: Text(
                'You won!',
                style: TextStyle(fontFamily: 'Permanent Marker', fontSize: 50),
              ),
            ),
            gap,
            Center(
              child: Text(
                'Time: ${score.formattedTime}',
                style: const TextStyle(
                    fontFamily: 'Permanent Marker', fontSize: 20),
              ),
            ),
          ],
        ),
        rectangularMenuArea: Container(
          alignment: Alignment.bottomCenter,
          child: Row(
            children: [
              MyButton(
                onPressed: () {
                  GoRouter.of(context).go('/play');
                },
                child: const Text('Back'),
              ),
              MyButton(
                onPressed: () {
                  if (score.level == 8){
                    GoRouter.of(context).go('/play');
                  }
                  else{
                    GoRouter.of(context).go('/play/session/${(score.level+1)}');
                  }
                },
                child: const Text('Continue'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
