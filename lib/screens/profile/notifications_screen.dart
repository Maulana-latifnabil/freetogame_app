import 'package:flutter/material.dart';

// Kelas untuk layar notifikasi
class NotificationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifikasi dan Penawaran'), // Judul AppBar
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0), // Padding untuk ListView
        children: [
          ListTile(
            title: Text('Pengaturan Notifikasi'),
            subtitle: Text(
                'Atur preferensi notifikasi aplikasi'), // Deskripsi singkat
            trailing: Icon(Icons.arrow_forward_ios), // Ikon di sebelah kanan
            onTap: () {
              // Tambahkan logika navigasi atau tindakan sesuai kebutuhan
            },
          ),
          ListTile(
            title: Text('Daftar Notifikasi'),
            subtitle: Text('Lihat riwayat notifikasi'), // Deskripsi singkat
            trailing: Icon(Icons.arrow_forward_ios), // Ikon di sebelah kanan
            onTap: () {
              // Tambahkan logika navigasi atau tindakan sesuai kebutuhan
            },
          ),
          ListTile(
            title: Text('Penawaran Spesial'),
            subtitle: Text('Lihat penawaran dan promosi'), // Deskripsi singkat
            trailing: Icon(Icons.arrow_forward_ios), // Ikon di sebelah kanan
            onTap: () {
              // Tambahkan logika navigasi atau tindakan sesuai kebutuhan
            },
          ),
          ListTile(
            title: Text('Pemberitahuan Penting'),
            subtitle: Text('Notifikasi peristiwa penting'), // Deskripsi singkat
            trailing: Icon(Icons.arrow_forward_ios), // Ikon di sebelah kanan
            onTap: () {
              // Tambahkan logika navigasi atau tindakan sesuai kebutuhan
            },
          ),
          ListTile(
            title: Text('Pengaturan Preferensi'),
            subtitle:
                Text('Atur preferensi notifikasi Anda'), // Deskripsi singkat
            trailing: Icon(Icons.arrow_forward_ios), // Ikon di sebelah kanan
            onTap: () {
              // Tambahkan logika navigasi atau tindakan sesuai kebutuhan
            },
          ),
        ],
      ),
    );
  }
}
