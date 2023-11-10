import 'package:flutter/material.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final _locationController = TextEditingController();


  @override
  void dispose(){
    _locationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Search City"),),
      body:  Container(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
        child: Center(child: Column(
          children: [
            TextFormField(
              controller: _locationController,

            ),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: (){}, child: Text("Search"))
          ],
        )),
      ),

    );
  }
}
