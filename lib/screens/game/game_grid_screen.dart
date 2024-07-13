import 'package:flutter/material.dart';
import '../../models/game.dart'; // Import model Game
import '../../services/api_service.dart'; // Import ApiService untuk mengambil data game dari API
import 'game_detail_screen.dart'; // Import halaman detail permainan
import 'package:freetogame_app/screens/profile/profile_screen.dart'; // Import ProfileScreen
import '../login/login_screen.dart'; // Import LoginScreen

// Kelas Stateful untuk menampilkan grid game
class GameGridScreen extends StatefulWidget {
  @override
  _GameGridScreenState createState() => _GameGridScreenState();
}

class _GameGridScreenState extends State<GameGridScreen> {
  late Future<List<Game>>
      futureGames; // Future untuk menyimpan data game dari API
  List<Game> allGames = []; // List untuk menyimpan semua game dari API
  List<Game> filteredGames =
      []; // List untuk menyimpan game yang difilter berdasarkan pencarian
  String searchQuery = ''; // String untuk menyimpan query pencarian pengguna
  int _selectedIndex = 0; // Index terpilih pada bottom navigation bar

  @override
  void initState() {
    super.initState();
    futureGames = ApiService()
        .fetchGames(); // Mengambil data game dari API saat inisialisasi
    futureGames.then((games) {
      setState(() {
        allGames = games; // Mengisi list allGames dengan data game dari API
        filteredGames =
            games; // Mengisi list filteredGames dengan data game dari API
      });
    });
  }

  // Fungsi untuk memperbarui pencarian
  void updateSearchQuery(String newQuery) {
    setState(() {
      searchQuery = newQuery; // Memperbarui nilai searchQuery dengan input baru
      filteredGames = allGames.where((game) {
        return game.title.toLowerCase().contains(
            searchQuery.toLowerCase()); // Memfilter game berdasarkan judul
      }).toList();
    });
  }

  // Fungsi untuk menangani perubahan item terpilih pada bottom navigation bar
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Memperbarui index terpilih
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetOptions = <Widget>[
      buildGameGrid(), // Fungsi untuk menampilkan grid game
      ProfileScreen(), // Halaman profil pengguna
    ];

    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacementNamed(
            context, '/'); // Navigasi kembali ke halaman utama
        return false;
      },
      child: Scaffold(
        body: Container(
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
          child: _widgetOptions.elementAt(
              _selectedIndex), // Menampilkan widget sesuai dengan index terpilih
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home), // Icon untuk halaman utama
              label: 'Home', // Label untuk halaman utama
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person), // Icon untuk halaman profil
              label: 'Profile', // Label untuk halaman profil
            ),
          ],
          currentIndex:
              _selectedIndex, // Index terpilih pada bottom navigation bar
          selectedItemColor: Colors.blue, // Warna terpilih untuk item
          onTap: _onItemTapped, // Fungsi untuk menangani ketika item dipilih
        ),
      ),
    );
  }

  // Fungsi untuk membangun grid game
  Widget buildGameGrid() {
    return Column(
      children: [
        SizedBox(height: 50.0), // Menambahkan ruang di atas
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 16.0), // Padding horizontal
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white, // Warna latar belakang kontainer
              borderRadius: BorderRadius.circular(30.0), // Border radius
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5), // Warna bayangan
                  spreadRadius: 2, // Radius penyebaran
                  blurRadius: 5, // Radius blur
                  offset: Offset(0, 3), // Offset bayangan
                ),
              ],
            ),
            child: TextField(
              onChanged:
                  updateSearchQuery, // Fungsi yang dipanggil saat nilai input berubah
              decoration: InputDecoration(
                hintText: 'Search games...', // Hint teks untuk input pencarian
                border: InputBorder.none, // Tidak menampilkan border
                contentPadding:
                    EdgeInsets.symmetric(vertical: 15.0), // Padding konten
                prefixIcon: Icon(
                  Icons.search, // Icon search
                  color: Colors.blue, // Warna icon search
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 10.0), // Menambahkan ruang di bawah search bar
        Expanded(
          child: FutureBuilder<List<Game>>(
            future: futureGames, // Future untuk menampilkan data game
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                    child:
                        CircularProgressIndicator()); // Indikator loading saat tunggu
              } else if (snapshot.hasError) {
                return Center(
                    child: Text(
                        'Error: ${snapshot.error}')); // Teks jika terjadi error
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(
                    child: Text(
                        'No games found')); // Teks jika tidak ada data game
              } else {
                return GridView.builder(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0), // Padding horizontal untuk grid
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Jumlah kolom dalam grid
                    childAspectRatio: 0.75, // Rasio aspek untuk setiap item
                    mainAxisSpacing: 16.0, // Spasi antar item vertikal
                    crossAxisSpacing: 16.0, // Spasi antar item horizontal
                  ),
                  itemCount: filteredGames.length, // Jumlah item dalam grid
                  itemBuilder: (context, index) {
                    Game game = filteredGames[
                        index]; // Mengambil game pada indeks tertentu
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => GameDetailScreen(
                                game: game), // Navigasi ke halaman detail game
                          ),
                        );
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(15.0), // Border radius card
                        ),
                        elevation: 5, // Elevasi card
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(15.0)),
                                child: Image.network(
                                  game.thumbnail, // Gambar thumbnail game
                                  fit: BoxFit.cover, // Fitur image cover
                                  width: double.infinity, // Lebar gambar
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(
                                  8.0), // Padding dalam card
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    game.title, // Judul game
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    maxLines: 1, // Batas maksimum baris teks
                                    overflow:
                                        TextOverflow.ellipsis, // Overflow teks
                                  ),
                                  SizedBox(
                                      height:
                                          4.0), // Ruang antara judul dan genre
                                  Text(
                                    game.genre, // Genre game
                                    style: TextStyle(
                                        color: Colors.grey), // Warna teks genre
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
