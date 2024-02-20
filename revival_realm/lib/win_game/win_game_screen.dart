import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../audio/audio_controller.dart';
import '../audio/sounds.dart';
import '../game_internals/score.dart';
import 'package:google_fonts/google_fonts.dart';
// import '../level_selection/levels.dart';
// import '../style/my_button.dart';
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
    final audioController = context.watch<AudioController>();
    // final level = context.watch<GameLevel>();

    const gap = SizedBox(height: 10);

    return Scaffold(
      backgroundColor: palette.champange,
      body: ResponsiveScreen(
        squarishMainArea: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            gap,
            Center(
              child: Text(
              'Awesome!',
              textAlign: TextAlign.center,
              style: GoogleFonts.outfit(
                fontSize: 55,
              ),
            ),
            ),
            gap,
            Center(
              child: Text(
              'Time:',
              textAlign: TextAlign.center,
              style: GoogleFonts.outfit(
                fontSize: 24,
              ),
            ),
            ),
            Center(
              child: Text(
              score.formattedTime,
              textAlign: TextAlign.center,
              style: GoogleFonts.outfit(
                fontSize: 55,
              ),
            ),
            ),
            gap,
            Stack(
              alignment: Alignment.center,
              children:[
                Container(
                  alignment: Alignment.center,
                  color: Colors.white70,
                  child: Text(
                    score.level == 1? "\nSingle use plastics, such as those made of styrofoam, take hundreds of years to decompose. \n During this time, they can persist in the environment, causing ongoing harm to ecosystems.\n":
                    score.level == 2? "\nSingle-use plastics contribute significantly to plastic pollution. \nImproper disposal leads to plastics ending up in oceans, rivers, and other ecosystems, \n harming marine life and the overall health of aquatic environments.\n":
                    score.level == 3? "\nOver time, plastic containers can break down into smaller particles known as microplastics. \n These tiny particles can contaminate soil and water, posing risks to both terrestrial and aquatic organisms, \n and even entering the food chain.\n":
                    score.level == 4? "\nThe production of single-use plastics consumes valuable natural resources, such as fossil fuels and water. \n The extraction and processing of these resources contribute to environmental degradation and contribute to climate change.\n":
                    score.level == 5? "\nThe production and disposal of single-use plastics contribute to greenhouse gas emissions. \n These emissions contribute to climate change, affecting weather patterns, sea levels, and overall environmental stability.\n":
                    score.level == 6? "\nImproper disposal of single-use plastics can lead to overflowing landfills. \n Landfills contribute to soil pollution and can release harmful substances into the environment, \n affecting nearby ecosystems and communities.\n":
                    score.level == 7? "\nAnimals can mistake single-use plastics for food or become entangled in them. \n Ingesting plastics can lead to internal injuries, malnutrition, and, in some cases, death. \n Entanglement poses risks to the mobility and survival of various wildlife species.\n":
                    score.level == 8? "\nImproperly discarded single-use plastics contribute to litter, negatively impacting the aesthetic quality of landscapes. \n This not only affects the visual appeal of an area but can also deter tourism and recreational activities.\n":
                    "\nSome single-use containers may contain harmful chemicals, such as phthalates and bisphenol A (BPA), which can leach into the environment over time. These chemicals may have adverse effects on human health and ecosystems.\n",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.outfit(
                      fontSize: 24,
                    ),
                  )
                ),
              ]
            )
          ],
        ),
        rectangularMenuArea:
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(flex: 2, child: Container(),),
                ElevatedButton(
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
              Flexible(flex: 1, child: Container(),),
              ElevatedButton(
                onPressed: () {
                  if (score.level == 8){
                    audioController.playSfx(SfxType.peel);
                    GoRouter.of(context).go('/play');
                      
                  }
                  else{
                    audioController.playSfx(SfxType.peel);
                    GoRouter.of(context).go('/play/session/${(score.level+1)}');
                  }
                },
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.lightGreen.shade900),
                  padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(14)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0),
                      side: const BorderSide(color: Colors.transparent)
                    )
                  )
                ),
                child: Text(
                  'Continue',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.outfit(
                    fontSize: 28,
                ),),
              ),
              Flexible(flex: 2, child: Container(),)
              ],
            ),
        // Container(
        //   alignment: Alignment.bottomCenter,
        //   child: Row(
        //     children: [
        //       ElevatedButton(
        //       onPressed: () {
        //         audioController.playSfx(SfxType.peel);
        //         GoRouter.of(context).go('/play');
        //       },
        //       style: ButtonStyle(
        //         foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        //         backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
        //         padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(14)),
        //         shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        //           RoundedRectangleBorder(
        //             borderRadius: BorderRadius.circular(40.0),
        //             side: const BorderSide(color: Colors.transparent)
        //           )
        //         )
        //       ),
        //       child: Text(
        //         'Back',
        //         textAlign: TextAlign.center,
        //         style: GoogleFonts.outfit(
        //           fontSize: 28,
        //       ),),
        //     ),
        //     ElevatedButton(
        //       onPressed: () {
        //         if (score.level == 8){
        //           audioController.playSfx(SfxType.peel);
        //           GoRouter.of(context).go('/play');
                    
        //         }
        //         else{
        //           audioController.playSfx(SfxType.peel);
        //           GoRouter.of(context).go('/play/session/${(score.level+1)}');
        //         }
        //       },
        //       style: ButtonStyle(
        //         foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        //         backgroundColor: MaterialStateProperty.all<Color>(Colors.lightGreen.shade900),
        //         padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(14)),
        //         shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        //           RoundedRectangleBorder(
        //             borderRadius: BorderRadius.circular(40.0),
        //             side: const BorderSide(color: Colors.transparent)
        //           )
        //         )
        //       ),
        //       child: Text(
        //         'Continue',
        //         textAlign: TextAlign.center,
        //         style: GoogleFonts.outfit(
        //           fontSize: 28,
        //       ),),
        //     ),
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
