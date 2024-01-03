import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice_riverpod/provider/providers.dart';

class StreamProviderScreen extends StatelessWidget {
  const StreamProviderScreen({super.key});

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
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const NumberScreen()));
    },
    child: const Text("Stream Provider"),
  );
}

class NumberScreen extends ConsumerWidget {
  const NumberScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var asyncValue = ref.watch(numbersProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Number Screen'),
        ),
        body: asyncValue.when(data: (data) {
          return Center(
            child: Text(data.toString()),
          );
        }, error: (error, stackTrace) {
          return Text(error.toString());
        }, loading: () {
          return const CircularProgressIndicator();
        },));
  }
}
