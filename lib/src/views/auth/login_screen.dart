import 'dart:async';

import 'package:climat/main.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  late final StreamSubscription<AuthState> _authSubscription;


  @override
  void initState() {
    super.initState();
    _authSubscription = supabase.auth.onAuthStateChange.listen((event) {
      final session = event.session;
      if(session!=null){
        Navigator.of(context).pushReplacementNamed("/weather");
      }

    });
  }

  @override
  void dispose(){
    _emailController.dispose();
    _authSubscription.cancel();
    super.dispose();
  }



  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login"),),
      body: Container(
        margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),

        child: Center(
          child: Column(
            children: [
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  label: Text("Enter your Email")

                ),

              ),

              const SizedBox(height: 20),
              ElevatedButton(onPressed: () async {
                try{
                  final email = _emailController.text.trim();
                  await supabase.auth.signInWithOtp(email: email, emailRedirectTo: "io.supabase.flutterquickstart://login-callback/");
                  if(mounted){
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Check your Inbox to verify email"))
                    );
                  }

                } on AuthException catch (error){

                  ScaffoldMessenger.of(context).showSnackBar(
                       SnackBar(content: Text(error.message))
                  );

                }

                catch (error){

                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Error Occurred!"))
                  );

                }

              }, child: const Text("Get Magic Link for Authentication"))
            ],

          ),
        ),
      ),
    );
  }
}
