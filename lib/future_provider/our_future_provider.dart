import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice_riverpod/provider/providers.dart';

class FutureProviderScreen extends StatelessWidget {
  const FutureProviderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _buildButton(context),
      ),
    );
  }
}

Widget _buildButton(BuildContext context) {
  return ElevatedButton(
    onPressed: () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const WeatherScreen()));
    },
    child: const Text("Future Provider"),
  );
}

class WeatherScreen extends ConsumerWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Todays Weather'),
        ),
        body: ref.watch(weatherProvider('Lucknow')).when(data: (data){
          return Center(child: Text(data.toString()),);
        }, error: (error,s){
          return Text(error.toString());
        }, loading: (){
          return Center(child: CircularProgressIndicator());})
        
        
        
        );
  }
}
