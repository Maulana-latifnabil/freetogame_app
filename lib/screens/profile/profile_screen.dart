import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freetogame_app/screens/game/game_grid_screen.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final FirebaseAuth _auth =
      FirebaseAuth.instance; // Inisialisasi Firebase Auth
  final FirebaseFirestore _firestore =
      FirebaseFirestore.instance; // Inisialisasi Firestore
  User? user; // Variabel untuk menyimpan informasi user
  String username = ''; // Variabel untuk menyimpan username
  String email = ''; // Variabel untuk menyimpan email

  @override
  void initState() {
    super.initState();
    user = _auth.currentUser; // Ambil user saat ini
    if (user != null) {
      email = user!.email!; // Ambil email user
      _firestore
          .collection('users')
          .doc(user!.uid)
          .get()
          .then((DocumentSnapshot documentSnapshot) {
        if (documentSnapshot.exists) {
          setState(() {
            username = documentSnapshot
                .get('username'); // Ambil username dari Firestore
          });
        }
      });
    }
  }

  // Fungsi untuk menampilkan dialog konfirmasi logout
  void _confirmLogoutDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Konfirmasi Logout'),
          content: Text('Apakah Anda yakin ingin keluar dari akun ini?'),
          actions: <Widget>[
            TextButton(
              child: Text('Tidak'),
              onPressed: () {
                Navigator.of(context).pop(); // Tutup dialog
              },
            ),
            TextButton(
              child: Text('Ya'),
              onPressed: () async {
                await _auth.signOut(); // Proses logout
                Navigator.pushNamedAndRemoveUntil(context, '/',
                    (route) => false); // Navigasi ke halaman login
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      GameGridScreen()), // Navigasi ke halaman GameGridScreen
            );
          },
        ),
      ),
      body: Stack(
        children: [
          // Latar belakang dengan gradasi warna
          Container(
            height: MediaQuery.of(context).size.height,
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
          ),
          // Konten utama layar
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 5.0), // Spasi di atas CircleAvatar
                CircleAvatar(
                  backgroundColor: Colors.deepPurpleAccent,
                  radius: 60.0, // Ukuran lingkaran
                  child: Text(
                    username.isNotEmpty
                        ? username[0]
                        : 'U', // Huruf pertama username atau 'U'
                    style: TextStyle(
                      fontSize: 60.0,
                      color: const Color.fromARGB(255, 249, 249, 249),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  username, // Tampilkan username
                  style: TextStyle(
                    fontSize: 30.0,
                    color: const Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  email, // Tampilkan email
                  style: TextStyle(
                    fontSize: 18.0,
                    color: const Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                SizedBox(height: 20.0),
                Container(
                  width: MediaQuery.of(context).size.width *
                      0.8, // Lebar 80% dari lebar layar
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(Icons.apps, color: Colors.blueAccent),
                        title: Text('Kelola Aplikasi'),
                        onTap: () {
                          Navigator.pushNamed(context,
                              '/manage_apps'); // Navigasi ke halaman Manage Apps
                        },
                      ),
                      Divider(), // Garis pemisah antar item
                      ListTile(
                        leading:
                            Icon(Icons.notifications, color: Colors.blueAccent),
                        title: Text('Notifikasi dan Penawaran'),
                        onTap: () {
                          Navigator.pushNamed(context,
                              '/notifications'); // Navigasi ke halaman Notifications
                        },
                      ),
                      Divider(),
                      ListTile(
                        leading:
                            Icon(Icons.collections, color: Colors.blueAccent),
                        title: Text('Koleksi'),
                        onTap: () {
                          Navigator.pushNamed(context,
                              '/collection'); // Navigasi ke halaman Collection
                        },
                      ),
                      Divider(),
                      ListTile(
                        leading: Icon(Icons.settings, color: Colors.blueAccent),
                        title: Text('Setelan'),
                        onTap: () {
                          Navigator.pushNamed(context,
                              '/settings'); // Navigasi ke halaman Settings
                        },
                      ),
                      Divider(),
                      ListTile(
                        leading: Icon(Icons.help, color: Colors.blueAccent),
                        title: Text('Bantuan & Masukan'),
                        onTap: () {
                          Navigator.pushNamed(context,
                              '/help_feedback'); // Navigasi ke halaman Help & Feedback
                        },
                      ),
                      Divider(),
                      ListTile(
                        leading: Icon(Icons.logout, color: Colors.blueAccent),
                        title: Text('Log Out'),
                        onTap: () {
                          _confirmLogoutDialog(); // Panggil fungsi konfirmasi logout
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
