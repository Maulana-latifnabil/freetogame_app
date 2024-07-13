import 'package:flutter/material.dart';

// Kelas untuk layar "Kelola Aplikasi"
class ManageAppsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kelola Aplikasi'), // Judul AppBar
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0), // Padding untuk ListView
        children: [
          ListTile(
            title: Text('Aplikasi Terhubung'),
            subtitle: Text('5 aplikasi terhubung'), // Deskripsi singkat
            trailing: Icon(Icons.arrow_forward_ios), // Ikon di sebelah kanan
            onTap: () {
              // Tambahkan logika navigasi atau tindakan sesuai kebutuhan
            },
          ),
          ListTile(
            title: Text('Status Aplikasi'),
            subtitle: Text('Semua aplikasi aktif'), // Deskripsi singkat
            trailing: Icon(Icons.arrow_forward_ios), // Ikon di sebelah kanan
            onTap: () {
              // Tambahkan logika navigasi atau tindakan sesuai kebutuhan
            },
          ),
          ListTile(
            title: Text('Pengaturan Aplikasi'),
            subtitle:
                Text('Pengaturan preferensi aplikasi'), // Deskripsi singkat
            trailing: Icon(Icons.arrow_forward_ios), // Ikon di sebelah kanan
            onTap: () {
              // Tambahkan logika navigasi atau tindakan sesuai kebutuhan
            },
          ),
          ListTile(
            title: Text('Pembaruan Aplikasi'),
            subtitle: Text('Cek pembaruan aplikasi'), // Deskripsi singkat
            trailing: Icon(Icons.arrow_forward_ios), // Ikon di sebelah kanan
            onTap: () {
              // Tambahkan logika navigasi atau tindakan sesuai kebutuhan
            },
          ),
          ListTile(
            title: Text('Histori Pemakaian'),
            subtitle: Text('Lihat statistik penggunaan'), // Deskripsi singkat
            trailing: Icon(Icons.arrow_forward_ios), // Ikon di sebelah kanan
            onTap: () {
              // Tambahkan logika navigasi atau tindakan sesuai kebutuhan
            },
          ),
          ListTile(
            title: Text('Integrasi Sosial'),
            subtitle: Text('Kelola integrasi sosial'), // Deskripsi singkat
            trailing: Icon(Icons.arrow_forward_ios), // Ikon di sebelah kanan
            onTap: () {
              // Tambahkan logika navigasi atau tindakan sesuai kebutuhan
            },
          ),
          ListTile(
            title: Text('Dukungan dan Bantuan'),
            subtitle:
                Text('Temukan bantuan untuk aplikasi'), // Deskripsi singkat
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
