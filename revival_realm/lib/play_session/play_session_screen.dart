import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:logging/logging.dart' hide Level;
import 'package:provider/provider.dart';

import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import '../audio/audio_controller.dart';
import '../audio/sounds.dart';
import '../game_internals/level_state.dart';
import '../game_internals/score.dart';
import '../level_selection/levels.dart';
import '../player_progress/player_progress.dart';
import '../style/palette.dart';
import 'game_widget.dart';

/// This widget defines the entirety of the screen that the player sees when
/// they are playing a level.
class PlaySessionScreen extends StatefulWidget {
  final GameLevel level;

  const PlaySessionScreen(this.level, {super.key});

  @override
  State<PlaySessionScreen> createState() => _PlaySessionScreenState();
}

class _PlaySessionScreenState extends State<PlaySessionScreen> {
  static final _log = Logger('PlaySessionScreen');

  static const _celebrationDuration = Duration(milliseconds: 3000);
  static const _preCelebrationDuration = Duration(milliseconds: 600);
  static const _styrofoamDuration = Duration(milliseconds: 2000);

  bool _won = false;
  bool _duringCelebration = false;
  bool _lidOn = false;

  late DateTime _startOfPlay;
  
  @override
  void initState() {
    super.initState();

    _startOfPlay = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();
    final audioController = context.watch<AudioController>();

    
    return MultiProvider(
      providers: [
        Provider.value(value: widget.level),
        // Create and provide the [LevelState] object that will be used
        // by widgets below this one in the widget tree.
        ChangeNotifierProvider(
          create: (context) => LevelState(
            foods: widget.level.foods,
            onWin: _playerWon,
          ),
        ),
      ],
      child: IgnorePointer(
        // Ignore all input during the celebration animation.
        ignoring: _duringCelebration,
        child: Scaffold(
          backgroundColor: palette.champange,
          // The stack is how you layer widgets on top of each other.
          // Here, it is used to overlay the winning confetti animation on top
          // of the game.
          body: Stack(
            children: [
              // This is the main layout of the play session screen,
              // with a settings button on top, the actual play area
              // in the middle, and a back button at the bottom.
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: InkResponse(
                      onTap: () => GoRouter.of(context).push('/settings'),
                      child:
                      Container(
                        padding: const EdgeInsets.all(20),
                        child: const Icon(
                          CupertinoIcons.gear_solid,
                          color: Colors.black45,
                          size: 50,
                          semanticLabel: 'Settings',
                            ),
                      ),
                      // child: Image.asset(
                      //   'assets/images/settings.png',
                      //   semanticLabel: 'Settings',
                      // ),
                    ),
                  ),
                  Opacity(
                    opacity: !_won ? 1.0 : 0.0,
                    child: Text(
                      'Level ${widget.level.id}',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.outfit(
                        fontSize: 40,
                      ),
                    ),
                  ),
                  const Spacer(flex:1),
                  const Expanded(
                    flex: 8,
                    // The actual UI of the game.
                    child:
                      Center(child: GameWidget())
                  ),
                  // This is the styrofoam to lunchbox animation swap that plays after winning the level
                  
                  const Spacer(flex:1),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: 
                    Opacity(
                      opacity: !_won ? 1.0 : 0.0,
                      child: ElevatedButton(
                        onPressed: () {
                          audioController.playSfx(SfxType.peel);
                          GoRouter.of(context).go('/play');
                        },
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                          padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(12)),
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
                    ),
                  ),
                ],
              ),
              Container(
                    alignment: Alignment.center,
                    child: Visibility(
                      visible: _won,
                      child: IgnorePointer(
                        child:
                        Stack(
                          alignment: Alignment.center,
                          children: [
                          Container(
                            alignment: Alignment.center,
                            child: FractionallySizedBox(
                              alignment: const Alignment(-1,-1),
                                widthFactor: (widget.level.id == 4 || widget.level.id == 6 ) ? 0.46 : 0.36,
                                  child: AnimatedCrossFade(
                                    duration: const Duration(seconds: 3),
                                    firstChild: Image.asset('assets/images/foods/styrofoam.png'),
                                    secondChild: Image.asset('assets/images/foods/level_${(widget.level.id)}_lid.png'),
                                    crossFadeState: _lidOn ? CrossFadeState.showSecond: CrossFadeState.showFirst,
                                    firstCurve: Curves.easeIn,
                                    secondCurve: Curves.easeOutCubic,
                                    sizeCurve: Curves.elasticInOut,
                                  ),
                                ),
                          ),
                        ],
                        )
                      ),
                    ),
                  ),
            ],
          ),
        ),
      ),
    );
  }
  
  Future<void> _playerWon() async {
    _log.info('Level ${widget.level.id} won');
    
    setState(() {
      _won = true;
    });

    final score = Score(
      widget.level.id,
      DateTime.now().difference(_startOfPlay),
    );

    final playerProgress = context.read<PlayerProgress>();
    playerProgress.setLevelReached(widget.level.id);

    // Let the player see the game just after winning for a bit.
    await Future<void>.delayed(_preCelebrationDuration);
    if (!mounted) return;

    setState(() {
      _duringCelebration = true;
    });

    final audioController = context.read<AudioController>();
    audioController.playSfx(SfxType.chime);

    /// Give the player some time to see the celebration animation.
    await Future<void>.delayed(_styrofoamDuration);
    if (!mounted) return;

    setState(() {
      _lidOn = true;
    });

    /// Give the player some time to see the celebration animation.
    await Future<void>.delayed(_celebrationDuration);
    if (!mounted) return;

    GoRouter.of(context).go('/play/won', extra: {'score': score});
    
  }
}
