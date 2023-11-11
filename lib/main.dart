import 'package:auto_route/auto_route.dart';
import 'package:climat/src/views/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'src/routes/routes_imports.dart';

void main() async {
  await dotenv.load(
    fileName: '.env',
  );
  await Supabase.initialize(url: dotenv.env["SUPABASE_URL"]!, anonKey: dotenv.env["SUPABASE_ANON_KEY"]!,
  authFlowType: AuthFlowType.pkce);
  runApp(ProviderScope(child: MyApp()));
}

final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Climat',
      theme: ThemeData(
        useMaterial3: true,
      ),
      // home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
      routerConfig: _appRouter.config(),
    );
  }

}

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.white,
    child: const LoginPage(),);
  }
}
