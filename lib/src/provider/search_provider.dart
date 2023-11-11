import 'package:climat/src/models/search_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/search_service.dart';

class SearchNotifier extends StateNotifier<List<Location>> {
  SearchNotifier() : super([]);
  final GetLocationService _searchService =
      GetLocationService(apiKey:  dotenv.env["API_KEY"]!);

  Future<void> fetchData(String searchTerm) async {
    state = await _searchService.getWeatherData(searchTerm);
  }
}

final dataProvider =
    StateNotifierProvider<SearchNotifier, List<Location>>((ref) {
  return SearchNotifier();
});
