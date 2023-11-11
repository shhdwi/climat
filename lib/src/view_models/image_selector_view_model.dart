abstract class WeatherImageSelector {
  String getWeatherImage(int weatherIconNumber);
}

class WeatherImageSelectorImpl implements WeatherImageSelector {
  @override
  String getWeatherImage(int weatherIconNumber) {
    if ([1, 2, 30].contains(weatherIconNumber)) {
      return 'assets/day_clear.json';
    } else if ([3, 4, 5, 6, 7, 8, 9, 10, 11, 32].contains(weatherIconNumber)) {
      return 'assets/day_cloudy.json';
    } else if (weatherIconNumber >= 12 && weatherIconNumber <= 18) {
      return 'assets/day_rainy.json';
    } else if ((weatherIconNumber >= 19 && weatherIconNumber <= 29) ||
        weatherIconNumber == 31) {
      return 'assets/day_snow.json';
    } else if ([33, 34].contains(weatherIconNumber)) {
      return 'assets/night_clear.json';
    } else if (weatherIconNumber >= 35 && weatherIconNumber <= 38) {
      return 'assets/night_cloudy.json';
    } else if (weatherIconNumber >= 39 && weatherIconNumber <= 42) {
      return 'assets/night_rainy.json';
    } else if ([43, 44].contains(weatherIconNumber)) {
      return 'assets/night_snow.json';
    } else {
      return 'assets/default.json'; // Default image if the number doesn't match any condition
    }
  }
}
