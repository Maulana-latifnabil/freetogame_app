import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Kelas untuk layar "Login"
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  final FirebaseAuth _auth =
      FirebaseAuth.instance; // Instance dari FirebaseAuth untuk otentikasi
  final TextEditingController _emailController =
      TextEditingController(); // Controller untuk input email
  final TextEditingController _passwordController =
      TextEditingController(); // Controller untuk input password
  String _errorMessage = ''; // Variabel untuk menyimpan pesan kesalahan

  late AnimationController _animationController; // Controller animasi
  late Animation<double> _fadeAnimation; // Animasi fading

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    );
    _animationController.forward(); // Memulai animasi
  }

  @override
  void dispose() {
    _animationController.dispose(); // Melepaskan sumber daya animasi
    _emailController.dispose(); // Melepaskan sumber daya controller email
    _passwordController.dispose(); // Melepaskan sumber daya controller password
    super.dispose();
  }

  // Fungsi untuk masuk dengan email dan password
  Future<void> _signInWithEmailAndPassword(BuildContext context) async {
    try {
      if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
        setState(() {
          _errorMessage =
              'Please fill in both email and password'; // Set pesan kesalahan jika email atau password kosong
        });
        _showSnackbar(
            _errorMessage); // Tampilkan snackbar dengan pesan kesalahan
        return;
      }
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      _showSnackbar(
          'Successfully logged in'); // Tampilkan snackbar login berhasil
      Navigator.pushReplacementNamed(
          context, '/home'); // Navigasi ke halaman home setelah login berhasil
    } catch (e) {
      setState(() {
        _errorMessage =
            'Error signing in: ${e.toString()}'; // Set pesan kesalahan jika ada kesalahan saat masuk
      });
      _showSnackbar(_errorMessage); // Tampilkan snackbar dengan pesan kesalahan
    }
  }

  // Fungsi untuk menampilkan snackbar
  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message), // Isi snackbar dengan pesan yang diberikan
        backgroundColor: Colors.red, // Warna latar belakang snackbar
        duration: Duration(seconds: 2), // Durasi tampilan snackbar
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.deepPurpleAccent,
              Colors.white,
            ],
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/logo.png', // Gambar logo aplikasi
                    height: 150, // Ukuran tinggi logo
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'FreeToGame', // Judul aplikasi
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  if (_errorMessage.isNotEmpty)
                    Text(
                      _errorMessage,
                      style: TextStyle(color: Colors.red), // Pesan kesalahan
                    ),
                  SizedBox(height: 16.0),
                  _buildTextField(
                    controller: _emailController,
                    labelText: 'Email',
                    icon: Icons.email,
                  ),
                  SizedBox(height: 16.0),
                  _buildTextField(
                    controller: _passwordController,
                    labelText: 'Password',
                    icon: Icons.lock,
                    obscureText: true,
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      _signInWithEmailAndPassword(
                          context); // Tombol untuk login
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple.shade900,
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: Text(
                      'Login', // Label tombol login
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context,
                          '/register'); // Tombol untuk navigasi ke halaman registrasi
                    },
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text:
                                'Don\'t have an account? ', // Teks jika belum punya akun
                            style: TextStyle(color: Colors.black),
                          ),
                          TextSpan(
                            text: 'Register', // Teks untuk registrasi
                            style: TextStyle(color: Colors.blue),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Widget untuk membangun field input dengan dekorasi
  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    required IconData icon,
    bool obscureText = false,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(icon, color: Colors.deepPurple.shade900),
        filled: true,
        fillColor: Colors.white.withOpacity(0.9),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      obscureText: obscureText,
    );
  }
}
