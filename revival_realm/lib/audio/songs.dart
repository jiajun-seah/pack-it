const List<Song> songs = [
  Song('pack_it_bgm.mp3', 'Chill BGM'),
];

class Song {
  final String filename;

  final String name;

  const Song(this.filename, this.name);

  @override
  String toString() => 'Song<$filename>';
}