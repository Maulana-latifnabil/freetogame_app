import 'package:flutter/material.dart';

// Kelas untuk layar "Bantuan & Masukan"
class HelpFeedbackScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bantuan & Masukan'), // Judul di AppBar
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0), // Padding untuk konten di dalam layar
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment:
              CrossAxisAlignment.stretch, // Mengisi ruang secara horizontal
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigasi ke halaman Pusat Bantuan jika diperlukan
              },
              child: Text('Pusat Bantuan'), // Teks tombol "Pusat Bantuan"
            ),
            SizedBox(height: 16.0), // Spasi antara tombol
            ElevatedButton(
              onPressed: () {
                // Navigasi ke halaman Formulir Masukan jika diperlukan
              },
              child: Text('Beri Masukan'), // Teks tombol "Beri Masukan"
            ),
            SizedBox(height: 16.0), // Spasi antara tombol
            ElevatedButton(
              onPressed: () {
                // Navigasi ke halaman Hubungi Dukungan jika diperlukan
              },
              child: Text('Hubungi Dukungan'), // Teks tombol "Hubungi Dukungan"
            ),
          ],
        ),
      ),
    );
  }
}
