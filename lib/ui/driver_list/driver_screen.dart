import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../data/service/driver_service.dart';
import '../../domain/model/driver.dart';
import '../driver_detail/driver_detail_screen.dart';

class DriverScreen extends StatefulWidget {
  const DriverScreen({super.key});

  @override
  _DriverScreenState createState() => _DriverScreenState();
}

class _DriverScreenState extends State<DriverScreen> {
  late Future<List<Driver>> futureDrivers;

  @override
  void initState() {
    super.initState();
    futureDrivers = DriverService().fetchDrivers();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Driver>>(
      future: futureDrivers,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(
            child: Text(
              'Error al cargar los pilotos',
              style: GoogleFonts.robotoMono(fontSize: 18, color: Colors.red),
            ),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(
            child: Text(
              'No hay pilotos disponibles',
              style: GoogleFonts.robotoMono(fontSize: 18, color: Colors.white),
            ),
          );
        }

        final drivers = snapshot.data!;

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Dos pilotos por fila
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.85,
            ),
            itemCount: drivers.length,
            itemBuilder: (context, index) {
              final driver = drivers[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DriverDetailScreen(driver: driver),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(int.parse("0xFF${driver.teamColour}")),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 5,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.network(
                          driver.headshotUrl,
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        driver.fullName,
                        style: GoogleFonts.russoOne(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        driver.teamName,
                        style: GoogleFonts.robotoMono(
                          fontSize: 14,
                          color: Colors.white70,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
