import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class StationsApi {
  late final String baseUrl;

  StationsApi() {
    baseUrl = dotenv.env['STATIONS_BASE_URL'] ?? "";
  }

  Future<dynamic> fetchChargingStation() async {
    try {
      // Make API request
      final request = await http.get(
        Uri.parse(baseUrl),
        headers: {
          'User-Agent': 'E-Mobility',
          'Content-Type': 'application/json',
        },
      );

      // Check if the request was successful
      if (request.statusCode == 200) {
        final response = json.decode(request.body);
        print(response[0].runtimeType);

        return response;
      } else {
        throw Exception(
            "Failed to load data. Status code: ${request.statusCode}, Response: ${request.body}");
      }
    } catch (e) {
      // Catch any error and provide more detailed info
      throw Exception("Error during API request: $e");
    }
  }
}
