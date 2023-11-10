import 'package:flutter/material.dart';

import '../../../main.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  Future<void> _reditect() async {
    await Future.delayed(Duration.zero);
    final session = supabase.auth.currentSession;
    if(!mounted) return;
    if(session != null){
      Navigator.of(context).pushReplacementNamed('/weather');
    }else{
      Navigator.of(context).pushReplacementNamed('/login');

    }

  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
