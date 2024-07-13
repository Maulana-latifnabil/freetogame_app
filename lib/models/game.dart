// Kelas untuk merepresentasikan data game dari API
class Game {
  final int id; // Identifikasi unik untuk game
  final String title; // Judul game
  final String thumbnail; // URL gambar miniatur game
  final String genre; // Genre game
  final String description; // Deskripsi singkat game
  final String gameUrl; // URL untuk mengakses game
  final String platform; // Platform game (misalnya: PC, Android, iOS)
  final String publisher; // Penerbit game
  final String developer; // Pengembang game
  final String releaseDate; // Tanggal rilis game
  final String freetogameProfileUrl; // URL profil game di FreeToGame

  // Konstruktor untuk inisialisasi semua properti yang diperlukan
  Game({
    required this.id,
    required this.title,
    required this.thumbnail,
    required this.genre,
    required this.description,
    required this.gameUrl,
    required this.platform,
    required this.publisher,
    required this.developer,
    required this.releaseDate,
    required this.freetogameProfileUrl,
  });

  // Factory method untuk membuat objek Game dari JSON
  factory Game.fromJson(Map<String, dynamic> json) {
    return Game(
      id: json['id'], // Mendapatkan id dari JSON
      title: json['title'], // Mendapatkan judul game dari JSON
      thumbnail: json['thumbnail'], // Mendapatkan URL thumbnail dari JSON
      genre: json['genre'], // Mendapatkan genre game dari JSON
      description: json[
          'short_description'], // Mendapatkan deskripsi singkat game dari JSON
      gameUrl: json['game_url'] ??
          'N/A', // Mendapatkan URL game atau default 'N/A' jika tidak ada
      platform: json['platform'] ??
          'N/A', // Mendapatkan platform game atau default 'N/A' jika tidak ada
      publisher: json['publisher'] ??
          'N/A', // Mendapatkan penerbit game atau default 'N/A' jika tidak ada
      developer: json['developer'] ??
          'N/A', // Mendapatkan pengembang game atau default 'N/A' jika tidak ada
      releaseDate: json['release_date'] ??
          'N/A', // Mendapatkan tanggal rilis game atau default 'N/A' jika tidak ada
      freetogameProfileUrl: json['freetogame_profile_url'] ??
          'N/A', // Mendapatkan URL profil game di FreeToGame atau default 'N/A' jika tidak ada
    );
  }
}
