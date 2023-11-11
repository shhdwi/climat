import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/search_model.dart';
class GetLocationService {
  final String apiKey;
  GetLocationService({required this.apiKey});

  Future<List<Location>> getWeatherData(String? city) async {

    final url =
        'https://dataservice.accuweather.com/locations/v1/cities/autocomplete?apikey=$apiKey&q=$city';
    final response = await http.get(Uri.parse(url));
    if (response?.statusCode == 200) {
      if(city != ''){
      final List body = json.decode(response.body);
      return body.map((e) => Location.fromJson(e)).toList();}
      else{
        return [];
      }
    } else {
      throw Exception('Failed to fetch corresponding city data');
    }
  }
}