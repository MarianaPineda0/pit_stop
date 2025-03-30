import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String _baseUrl = 'https://api.openf1.org/v1/';

  Future<List<dynamic>> getData(String endpoint, {Map<String, String>? params}) async {
    final uri = Uri.https(_baseUrl.replaceFirst('https://', ''), endpoint, params);
    
    final response = await http.get(uri);

    try {
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Error ${response.statusCode}: ${response.body}');
      }
    } catch (error) {
      throw Exception('Error al procesar la respuesta del API: $error');
    }
  }
}