const Set<Song> songs = {
  // Filenames with whitespace break package:audioplayers on iOS
  // (as of February 2022), so we use no whitespace.
  Song('pack_it_bgm_extended.mp3', 'Pack It BGM Extended'),
};

class Song {
  final String filename;

  final String name;

  const Song(this.filename, this.name);

  @override
  String toString() => 'Song<$filename>';
}