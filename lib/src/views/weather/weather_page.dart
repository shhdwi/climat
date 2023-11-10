import 'dart:async';
import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';
// Assuming you have a data model and a service to fetch data
class DataModel {
  final String title;

  DataModel(this.title);

// Add a method to parse JSON or any other parsing logic
}

class DataService {
  Future<List<DataModel>> fetchData(String searchTerm) async {
    // Implement your API call logic here and return a list of DataModels
    // For example, you might call an HTTP client and parse the JSON response
    await Future.delayed(Duration(seconds: 1)); // Simulating network delay
    return List.generate(10, (index) => DataModel('Item $index for $searchTerm'));
  }
}

// State notifier to manage the fetching of data
class DataNotifier extends StateNotifier<List<DataModel>> {
  DataNotifier(this.ref) : super([]);
  final Ref ref;

  Future<void> fetchData(String searchTerm) async {
    final data = await DataService().fetchData(searchTerm);
    state = data;
  }
}

// Provider to expose DataNotifier
final dataProvider = StateNotifierProvider<DataNotifier, List<DataModel>>((ref) {
  return DataNotifier(ref);
});

// Debouncer to handle the search term input
final searchProvider = StateNotifierProvider<SearchStateNotifier, String>((ref) {
  return SearchStateNotifier(ref);
});

class SearchStateNotifier extends StateNotifier<String> {
  SearchStateNotifier(this.ref) : super('');
  final Ref ref;
  Timer? _debounce;

  void setSearchTerm(String searchTerm) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () async {
      // After the debounce time, fetch the data with the current search term
      await ref.read(dataProvider.notifier).fetchData(searchTerm);
      state = searchTerm; // Set the current state
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }
}

class MyFormWidget extends ConsumerStatefulWidget {

  @override
  _MyFormWidgetState createState() => _MyFormWidgetState();
}

class _MyFormWidgetState extends ConsumerState<MyFormWidget> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      ref.read(searchProvider.notifier).setSearchTerm(_controller.text);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final items = ref.watch(dataProvider);

    return Column(
      children: [
        TextField(
          controller: _controller,
          decoration: InputDecoration(
            labelText: 'Search',
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return ListTile(
                title: Text(item.title),
              );
            },
          ),
        ),
      ],
    );
  }
}
