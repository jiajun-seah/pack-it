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

enum SfxType {
  peel,
  pop,
  chime
}