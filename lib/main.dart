import 'package:flutter/material.dart';
import 'package:pit_stop/ui/driver_list/driver_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'F1 Drivers',
      theme: ThemeData.dark(),
      home: const DriverPage(),
    );
  }
}
