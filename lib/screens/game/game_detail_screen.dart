import 'package:flutter/material.dart';
import '../../models/game.dart'; // Import model Game untuk mengakses properti game

// Kelas StatelessWidget untuk menampilkan detail game
class GameDetailScreen extends StatelessWidget {
  final Game game; // Variabel final untuk menyimpan data game

  const GameDetailScreen(
      {required this.game}); // Constructor untuk menerima game sebagai parameter

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(game.title), // Judul AppBar berdasarkan judul game
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white,
                Colors.deepPurpleAccent,
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Card pertama untuk menampilkan gambar dan informasi utama
                Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                        child:
                            Image.network(game.thumbnail), // Gambar utama game
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              game.title, // Judul game
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              game.genre, // Genre game
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 16.0),
                            Text(
                              'Description:', // Label deskripsi game
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              game.description, // Deskripsi game
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.0),
                // Card kedua untuk menampilkan informasi tambahan tentang game
                Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        infoRow('Game URL:', game.gameUrl,
                            context), // Informasi URL game
                        infoRow('Platform:',
                            game.platform), // Informasi platform game
                        infoRow('Publisher:',
                            game.publisher), // Informasi penerbit game
                        infoRow('Developer:',
                            game.developer), // Informasi pengembang game
                        infoRow('Release Date:',
                            game.releaseDate), // Informasi tanggal rilis game
                        infoRow('Profile URL:', game.freetogameProfileUrl,
                            context), // Informasi URL profil game
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Fungsi untuk membuat baris informasi dengan label dan nilai
  Widget infoRow(String label, String value, [BuildContext? context]) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label, // Label informasi (misalnya: Game URL, Platform, dll.)
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: GestureDetector(
              onTap: context != null
                  ? () {
                      // Implementasi logika navigasi di sini jika diperlukan
                    }
                  : null,
              child: Text(
                value, // Nilai informasi (misalnya: URL, nama platform, dll.)
                style: TextStyle(
                  fontSize: 16,
                  color: context != null
                      ? Colors.blue
                      : Colors
                          .black, // Warna teks berdasarkan keberadaan context
                  decoration: context != null
                      ? TextDecoration
                          .underline // Underline teks jika ada context
                      : TextDecoration.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
