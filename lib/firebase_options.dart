// File ini dihasilkan oleh FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// [FirebaseOptions] default untuk digunakan dengan aplikasi Firebase Anda.
///
/// Contoh:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    // Jika platform adalah web, lempar kesalahan karena tidak dikonfigurasi untuk web
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions belum dikonfigurasi untuk web - '
        'Anda dapat mengonfigurasi ulang ini dengan menjalankan FlutterFire CLI lagi.',
      );
    }
    // Memeriksa platform target dan mengembalikan opsi yang sesuai
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions belum dikonfigurasi untuk iOS - '
          'Anda dapat mengonfigurasi ulang ini dengan menjalankan FlutterFire CLI lagi.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions belum dikonfigurasi untuk macOS - '
          'Anda dapat mengonfigurasi ulang ini dengan menjalankan FlutterFire CLI lagi.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions belum dikonfigurasi untuk Windows - '
          'Anda dapat mengonfigurasi ulang ini dengan menjalankan FlutterFire CLI lagi.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions belum dikonfigurasi untuk Linux - '
          'Anda dapat mengonfigurasi ulang ini dengan menjalankan FlutterFire CLI lagi.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions tidak didukung untuk platform ini.',
        );
    }
  }

  // Opsi Firebase khusus untuk Android
  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAtYhgp4nxK25uENw3cpyR6O5fmPsrHsCY',
    appId: '1:616493922427:android:27dedd0c6b290c08050ade',
    messagingSenderId: '616493922427',
    projectId: 'freetogame-2024',
    storageBucket: 'freetogame-2024.appspot.com',
  );
}
