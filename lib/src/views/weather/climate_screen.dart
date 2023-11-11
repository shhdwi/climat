import 'package:auto_route/auto_route.dart';
import 'package:climat/src/views/weather/display_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../provider/weather_provider.dart';

@RoutePage()
class WeatherDetailPage extends ConsumerWidget {
  final String cityCode;
  final String city;

  const WeatherDetailPage(
      {Key? key, required this.cityCode, required this.city})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // A FutureProvider that fetches weather details
    final weatherProvider = weatherDetailsProvider(cityCode);

    return Scaffold(
      appBar: AppBar(
        title: const Text("WeatherApp"),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          // This line re-fetches the weather details
          ref.refresh(weatherProvider);
        },
        child: ref.watch(weatherProvider).when(
              data: (weather) {
                // Return a list view with a single child scroll view to enable pull-to-refresh
                return Center(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      WeatherScreen(
                          city: city,
                          temperatureCelsius:
                              '${weather.temperature!.metric!.value!.toStringAsFixed(0)}°C',
                          weatherDescription: weather.weatherText!,
                          weatherIconNumber: weather.weatherIcon!)
                    ],
                  ),
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stack) => Text('Error: $error'),
            ),
      ),
    );
  }
}
