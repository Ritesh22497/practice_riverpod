import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice_riverpod/provider/providers.dart';
import 'package:practice_riverpod/state_notifier_provider/counter_notifier.dart';

class StateNotifierProviderScreen extends StatelessWidget {
  const StateNotifierProviderScreen({super.key});

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
          MaterialPageRoute(builder: (context) => const CounterWidget()));
    },
    child: const Text("State Notifier Provider"),
  );
}

class CounterWidget extends ConsumerWidget {
  const CounterWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int count = ref.watch(counterProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Widget'),
      ),
      body: Center(
        child: Text(count.toString()),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterProvider.notifier).increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
