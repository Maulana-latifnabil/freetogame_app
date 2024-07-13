import 'package:flutter/material.dart';

// Widget untuk layar pengaturan
class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar di bagian atas layar dengan judul 'Setelan'
      appBar: AppBar(
        title: Text('Setelan'),
      ),
      // Body dari Scaffold berisi konten utama layar
      body: Padding(
        padding: EdgeInsets.all(16.0), // Memberi padding di sekitar konten
        child: Column(
          crossAxisAlignment: CrossAxisAlignment
              .stretch, // Membuat elemen kolom membentang selebar mungkin
          children: [
            // ListTile untuk Pengaturan Akun
            ListTile(
              title: Text('Pengaturan Akun'),
              leading: Icon(Icons.account_circle), // Ikon di sebelah kiri
              onTap: () {
                // Fungsi untuk navigasi ke halaman Pengaturan Akun jika diperlukan
              },
            ),
            Divider(), // Garis pemisah antar item
            // ListTile untuk Pengaturan Notifikasi
            ListTile(
              title: Text('Pengaturan Notifikasi'),
              leading: Icon(Icons.notifications),
              onTap: () {
                // Fungsi untuk navigasi ke halaman Pengaturan Notifikasi jika diperlukan
              },
            ),
            Divider(),
            // ListTile untuk Pengaturan Privasi
            ListTile(
              title: Text('Pengaturan Privasi'),
              leading: Icon(Icons.lock),
              onTap: () {
                // Fungsi untuk navigasi ke halaman Pengaturan Privasi jika diperlukan
              },
            ),
            Divider(),
            // ListTile untuk Pengaturan Umum Aplikasi
            ListTile(
              title: Text('Pengaturan Umum Aplikasi'),
              leading: Icon(Icons.settings),
              onTap: () {
                // Fungsi untuk navigasi ke halaman Pengaturan Umum Aplikasi jika diperlukan
              },
            ),
          ],
        ),
      ),
    );
  }
}
