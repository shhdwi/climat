import 'package:climat/src/views/auth/login_screen.dart';
import 'package:climat/src/views/auth/splash_screen.dart';
import 'package:climat/src/views/weather/weather_screen.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  await Supabase.initialize(url: 'https://kdxedaqwflkbgzxjwzlk.supabase.co', anonKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImtkeGVkYXF3ZmxrYmd6eGp3emxrIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTk1NDkxNjEsImV4cCI6MjAxNTEyNTE2MX0.A5oYBl21lCudRRSdR2WPpMoNOCrMmhFeFUc82OUDfXw",
  authFlowType: AuthFlowType.pkce);
  runApp(const MyApp());
}

final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Climat',
      theme: ThemeData(
        useMaterial3: true,
      ),
      // home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const MyHomePage(),
        '/login': (context) => const LoginPage(),
        '/weather': (context) => const WeatherPage()

      },
    );
  }

}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.white,
    child: const LoginPage(),);
  }
}
