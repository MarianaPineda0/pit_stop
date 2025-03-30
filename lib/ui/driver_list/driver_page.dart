import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'driver_screen.dart';

class DriverPage extends StatelessWidget {
  const DriverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text('Pilotos de F1', style: GoogleFonts.russoOne()),
      ),
      body: const DriverScreen(),
    );
  }
}
