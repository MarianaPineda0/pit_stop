import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pit_stop/domain/model/driver.dart';

class DriverService {
  final String apiUrl = 'https://api.openf1.org/v1/drivers';

  Future<List<Driver>> fetchDrivers() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);

        if (jsonData is List) {
          return jsonData.map((json) => Driver.fromJson(json)).toList();
        } else {
          throw Exception('El formato del JSON recibido no es una lista.');
        }
      } else {
        throw Exception('Error al obtener los datos. Código: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Ocurrió un error al procesar los datos del API: $error');
    }
  }
}
