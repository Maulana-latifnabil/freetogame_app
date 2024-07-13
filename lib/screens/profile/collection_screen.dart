import 'package:flutter/material.dart';

// Kelas untuk layar "Koleksi"
class CollectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Koleksi'), // Judul di AppBar
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0), // Padding untuk daftar item
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://example.com/game_thumbnail.jpg'), // Gambar untuk avatar lingkaran
            ),
            title: Text('Nama Game'), // Judul game
            subtitle: Text('Genre Game'), // Genre game
            onTap: () {
              // Navigasi ke halaman detail game jika diperlukan
            },
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://example.com/game_thumbnail.jpg'), // Gambar untuk avatar lingkaran
            ),
            title: Text('Nama Game'), // Judul game
            subtitle: Text('Genre Game'), // Genre game
            onTap: () {
              // Navigasi ke halaman detail game jika diperlukan
            },
          ),
          // Tambahkan lebih banyak ListTile sesuai dengan jumlah game dalam koleksi
        ],
      ),
    );
  }
}
