import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/weather_model.dart';
class GetWeatherService {
  final String apiKey;

  GetWeatherService({required this.apiKey});

  Future<Weather> getWeatherData(String code) async {
    final url =
        'https://dataservice.accuweather.com/currentconditions/v1/$code?apikey=$apiKey';
    final response = await http.get(Uri.parse(url));
    if (response?.statusCode == 200) {
      List body = json.decode(response.body);
      List<Weather> res = body.map((e) => Weather.fromJson(e)).toList();

      return res[0];
    } else {
      throw Exception('Failed to fetch corresponding city weather data');
    }
  }
}