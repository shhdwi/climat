import 'package:climat/src/utils/lottie.dart';
import 'package:flutter/material.dart';
import '../../view_models/image_selector_view_model.dart';

class WeatherScreen extends StatelessWidget {
  final String city;
  final String temperatureCelsius;
  final String weatherDescription;
  final int weatherIconNumber;

  const WeatherScreen({
    Key? key,
    required this.city,
    required this.temperatureCelsius,
    required this.weatherDescription,
    required this.weatherIconNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WeatherImageSelector selector = WeatherImageSelectorImpl();
    String weatherImage = selector.getWeatherImage(weatherIconNumber);

    return Center(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            LottieDisplayWidget(
                lottieAsset: weatherImage, width: 200, height: 200),
            Text(
              city,
              style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87),
            ),
            Text(
              temperatureCelsius,
              style: const TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87),
            ),
            const SizedBox(
              height: 100,
            ),
            Text(
              weatherDescription,
              style: const TextStyle(fontSize: 16, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }
}
