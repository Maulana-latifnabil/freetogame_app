class Game {
  final int id;
  final String title;
  final String thumbnail;
  final String genre;
  final String description; // Tambahkan properti description

  Game({
    required this.id,
    required this.title,
    required this.thumbnail,
    required this.genre,
    required this.description, // Tambahkan properti description
  });

  factory Game.fromJson(Map<String, dynamic> json) {
    return Game(
      id: json['id'],
      title: json['title'],
      thumbnail: json['thumbnail'],
      genre: json['genre'],
      description:
          json['short_description'], // Perbarui parsing JSON untuk description
    );
  }
}
