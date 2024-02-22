const Set<Song> songs = {
  Song('pack_it_bgm_extended.mp3', 'Pack It BGM Extended'),
};

class Song {
  final String filename;

  final String name;

  const Song(this.filename, this.name);

  @override
  String toString() => 'Song<$filename>';
}