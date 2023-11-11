import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/weather_model.dart';
import '../services/weather_service.dart';

final weatherDetailsProvider =
    FutureProvider.family<Weather, String>((ref, code) async {
  return GetWeatherService(apiKey: dotenv.env["API_KEY"]!)
      .getWeatherData(code);
});
