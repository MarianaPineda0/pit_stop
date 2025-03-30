import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../domain/model/driver.dart';

class DriverDetailScreen extends StatelessWidget {
  final Driver driver;

  const DriverDetailScreen({super.key, required this.driver});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(driver.fullName, style: GoogleFonts.russoOne(fontSize: 28)),
        backgroundColor: Color(int.parse("0xff" + driver.teamColour)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Hero(
                tag: driver.driverNumber,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      driver.headshotUrl,
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width * 0.9,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "#${driver.driverNumber} - ${driver.teamName}",
                style: GoogleFonts.robotoMono(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Color(int.parse("0xff" + driver.teamColour)),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _detailRow("Nombre Completo", driver.fullName),
                    _detailRow("Código de País", driver.countryCode),
                    _detailRow("Equipo", driver.teamName),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _detailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: GoogleFonts.robotoMono(fontSize: 18, color: Colors.white70)),
          Text(value, style: GoogleFonts.russoOne(fontSize: 18, color: Colors.white)),
        ],
      ),
    );
  }
}
