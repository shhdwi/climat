import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:climat/src/routes/routes_imports.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../provider/search_provider.dart';

@RoutePage()
class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final _locationController = TextEditingController();

  @override
  void dispose() {
    _locationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Search City"),
        ),
        body: const Padding(
          padding: EdgeInsets.all(18.0),
          child: SearchScreen(),
        ));
  }
}

final searchProvider =
    StateNotifierProvider<SearchStateNotifier, String>((ref) {
  return SearchStateNotifier(ref);
});

class SearchStateNotifier extends StateNotifier<String> {
  SearchStateNotifier(this.ref) : super('');
  final Ref ref;
  Timer? _debounce;

  void setSearchTerm(String searchTerm) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () async {
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

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  SearchScreenState createState() => SearchScreenState();
}

class SearchScreenState extends ConsumerState<SearchScreen> {
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
          decoration: const InputDecoration(
            labelText: 'Search',
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return ListTile(
                title: Text(item.localizedName!),
                onTap: () async {
                  await AutoRouter.of(context).push(WeatherDetailPageRoute(
                      cityCode: item.key!, city: item.localizedName!));
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
