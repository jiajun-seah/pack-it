List<String> soundTypeToFilename(SfxType type) {
  switch (type) {
    case SfxType.peel:
      return const [
        'peel1.mp3',
        'peel2.mp3',
        'peel3.mp3',
      ];
    case SfxType.pop:
      return const [
        'pop1.mp3',
        'pop2.mp3',
        'pop3.mp3',

      ];
    case SfxType.chime:
      return const [
        'chime.mp3',
      ];
  }
}

/// Allows control over loudness of different SFX types.
// double soundTypeToVolume(SfxType type) {
//   switch (type) {
//     case SfxType.peel:
//       return 1;
//     case SfxType.pop:
//       return 1;
//     case SfxType.chime:
//       return 1;
//   }
// }

enum SfxType {
  peel,
  pop,
  chime
}