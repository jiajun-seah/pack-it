import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher_string.dart';


import '../audio/audio_controller.dart';
import '../audio/sounds.dart';
import '../style/palette.dart';
import '../style/responsive_screen_landscape.dart';

class ExtrasScreen extends StatelessWidget {
  const ExtrasScreen({super.key});

  static const _gap = SizedBox(height: 60);

  @override
  Widget build(BuildContext context) {
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
              
              Text(
                'Extras',
                textAlign: TextAlign.center,
                style: GoogleFonts.outfit(
                  fontSize: 55,
                  fontWeight:FontWeight.w700
                ),
              ),
              _gap,
              Container(
                // color: Colors.white70,
                child: Text(
                  'Special Thanks',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.outfit(
                    fontSize: 28,
                    fontWeight:FontWeight.w600
                  ),
                ),
              ),
              Text(
                'Basic Template by Flutter Dev team \n Friends who helped to playtest and provide feedback',
                textAlign: TextAlign.center,
                style: GoogleFonts.outfit(
                  fontSize: 24,
                ),
              ),
              _gap,
              //  Text(
              //   'Tech Stack',
              //   textAlign: TextAlign.center,
              //   style: GoogleFonts.outfit(
              //     fontSize: 28,
              //     fontWeight:FontWeight.w600
              //   ),
              // ),
              // Text(
              //   'Programmed with: Flutter and Dart\n Assets: Procreate \n Music: GarageBand',
              //   textAlign: TextAlign.center,
              //   style: GoogleFonts.outfit(
              //     fontSize: 24,
              //   ),
              // ),
              // _gap,
               Text(
                'Socials',
                textAlign: TextAlign.center,
                style: GoogleFonts.outfit(
                  fontSize: 28,
                  fontWeight:FontWeight.w600
                ),
              ),
              // _gap,
              Container(
                child:
                  RichText(
                    text: TextSpan(children:[
                      TextSpan(
                        text: 'Find me on ',
                        style: GoogleFonts.outfit(
                          fontSize: 24,
                        ),
                      ),
                      TextSpan(
                        text: 'Github',
                        style: GoogleFonts.outfit(
                          fontSize: 24,
                          decoration: TextDecoration.underline
                        ),
                        recognizer: TapGestureRecognizer()..onTap = () {launchUrlString('https:///github.com/jiajun-seah');}
                      )
                    ])
                  ),
              ),
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