import 'package:flutter/material.dart';
import 'screens/login/login_screen.dart';
import 'screens/register/register_screen.dart';
import 'screens/game/game_grid_screen.dart';
import 'screens/profile/profile_screen.dart';
import 'screens/profile/manage_app_screen.dart';
import 'screens/profile/notifications_screen.dart';
import 'screens/profile/collection_screen.dart';
import 'screens/profile/settings_screen.dart';
import 'screens/profile/help_feedback_screen.dart';
import 'package:firebase_core/firebase_core.dart';

// Fungsi utama aplikasi
void main() async {
  // Menginisialisasi binding widget
  WidgetsFlutterBinding.ensureInitialized();
  // Menunggu inisialisasi Firebase
  await Firebase.initializeApp();
  // Menjalankan aplikasi
  runApp(MyApp());
}

// Kelas utama aplikasi
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Judul aplikasi
      title: 'FreeToGame',
      // Tema aplikasi
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // Rute awal saat aplikasi dibuka pertama kali
      initialRoute: '/',
      // Daftar rute yang tersedia di aplikasi
      routes: {
        // Rute untuk layar login
        '/': (context) => LoginScreen(),
        // Rute untuk layar registrasi
        '/register': (context) => RegisterScreen(),
        // Rute untuk layar beranda yang menampilkan grid game
        '/home': (context) => GameGridScreen(),
        // Rute untuk layar profil
        '/profile': (context) => ProfileScreen(),
        // Rute untuk layar manajemen aplikasi
        '/manage_apps': (context) => ManageAppsScreen(),
        // Rute untuk layar notifikasi
        '/notifications': (context) => NotificationsScreen(),
        // Rute untuk layar koleksi
        '/collection': (context) => CollectionScreen(),
        // Rute untuk layar pengaturan
        '/settings': (context) => SettingsScreen(),
        // Rute untuk layar bantuan dan feedback
        '/help_feedback': (context) => HelpFeedbackScreen(),
      },
    );
  }
}
