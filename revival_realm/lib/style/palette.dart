// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

/// A palette of colors to be used in the game.
///
/// The reason we're not going with something like Material Design's
/// `Theme` is simply that this is simpler to work with and yet gives
/// us everything we need for a game.
///
/// Games generally have more radical color palettes than apps. For example,
/// every level of a game can have radically different colors.
/// At the same time, games rarely support dark mode.
///
/// Colors taken from this fun palette:
/// https://lospec.com/palette-list/crayola84
///
/// Colors here are implemented as getters so that hot reloading works.
/// In practice, we could just as easily implement the colors
/// as `static const`. But this way the palette is more malleable:
/// we could allow players to customize colors, for example,
/// or even get the colors from the network.
class Palette {
  // Color get seed => const Color(0xFF0050bc);
  Color get pen => const Color(0xff1d75fb);
  Color get darkPen => const Color(0xFF0050bc);
  Color get redPen => const Color(0xFFd10841);
  Color get inkFullOpacity => const Color(0xff352b42);
  Color get ink => const Color(0xee352b42);
  Color get backgroundMain => const Color(0xffffffd1);
  Color get backgroundLevelSelection => const Color(0xffa2dcc7);
  Color get backgroundPlaySession => const Color(0xffffebb5);
  Color get background4 => const Color(0xffffd7ff);
  Color get backgroundSettings => const Color(0xffbfc8e3);
  Color get trueWhite => const Color(0xffffffff);
  
  //browns
  Color get darkMaroon => const Color(0xff2e222f);
  Color get mediumMaroon => const Color(0xff3e3546);
  Color get lightMaroon => const Color(0xff625565);
  Color get lightChocolate => const Color(0xff966c6c);
  Color get mudBrown => const Color(0xffab947a);
  Color get darkChocolate => const Color(0xff694f62);
  Color get purpleBrown => const Color(0xff7f708a);
  
  //whites
  Color get mediumGrey => const Color(0xff9babb2);
  Color get lightGrey => const Color(0xffc7dcd0);
  Color get white => const Color(0xffffffff);

  //reds
  Color get scarletRed => const Color(0xff6e2727);
  Color get autumnRed => const Color(0xffb33831);
  Color get darkOrange => const Color(0xffea4f36);
  Color get lightOrange => const Color(0xfff57d4a);
  Color get darkRed => const Color(0xffae2334);
  Color get bloodRed => const Color(0xffe83b3b);
  Color get mediumOrange => const Color(0xfffb6b1d);
  Color get mandarinOrange => const Color(0xfff79617);
  
  //yellows
  Color get bananaYellow => const Color(0xfff9c22b);
  Color get darkDirtyOrange => const Color(0xffcd683d);
  Color get lightDirtyOrange => const Color(0xffe6904e);
  Color get yellow => const Color(0xfffbb954);
  Color get darkYellow => const Color(0xff4c3e24);
  Color get darkYellowGreen => const Color(0xff676633);
  Color get mediumYellowGreen => const Color(0xffa2a947);
  Color get lightYellowGreen => const Color(0xffd5e04b);
  Color get lightYellow => const Color(0xfffbff86);

  //greens
  Color get darkGreen=> const Color(0xff165a4c);
  Color get mediumGreen => const Color(0xff239063);
  Color get lightGreen => const Color(0xff1ebc73);
  Color get brightGreen => const Color(0xff91db69);
  Color get limeGreen => const Color(0xffcddf6c);
  Color get darkForestGreen => const Color(0xff313638);
  Color get mediumForestGreen => const Color(0xff374e4a);
  Color get lightForestGreen => const Color(0xff547e64);
  Color get darkEarthgreen => const Color(0xff92a984);
  Color get lightEarthGreen => const Color(0xffb2ba90);

  //blues
  Color get darkTurqoise => const Color(0xff0b5e65);
  Color get mediumTurqoise => const Color(0xff0b8a8f);
  Color get lightTurqoise => const Color(0xff0eaf9b);
  Color get brightTurqoise => const Color(0xff30e1b9);
  Color get babyBlue => const Color(0xff8ff8e2);
  Color get darkDenimBlue => const Color(0xff323353);
  Color get mediumDenimBlue => const Color(0xff484a77);
  Color get lightDenimBlue => const Color(0xff4d65b4);
  Color get blue => const Color(0xff4d9be6);
  Color get skyBlue => const Color(0xff8fd3ff);

  //purples
  Color get mangosteen => const Color(0xff7a3045);
  Color get rambutan => const Color(0xff9e4539);
  Color get darkViolet => const Color(0xff45293f);
  Color get mediumViolet => const Color(0xff6b3e75);
  Color get lightViolet => const Color(0xff905ea9);
  Color get lavender => const Color(0xffa884f3);

  //pinks
  Color get pink => const Color(0xffeaaded);
  Color get darkHotPink => const Color(0xff753c54);
  Color get mediumHotPink => const Color(0xffa24b6f);
  Color get lightHotPink => const Color(0xffcf657f);
  Color get darkPink => const Color(0xffed8099);
  Color get purplePink => const Color(0xff831c5d);
  Color get redPink => const Color(0xffc32454);
  Color get brightHotPink => const Color(0xfff04f78);
  Color get darkBeige => const Color(0xfff68181);
  Color get mediumBeige => const Color(0xfffca790);
  Color get lightBeige => const Color(0xfffdcbb0);

}