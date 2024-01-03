import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice_riverpod/provider/providers.dart';

class CounterWidget extends ConsumerWidget {
  const CounterWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('State Provider CounterWidget'),
        ),
        body: Consumer(
          builder: (context, ref, child) {
            int count = ref.watch(counterStateProvider);
            return Center(
                child: Text(
                  
              count.toString(),
              style: const TextStyle(fontSize: 22),
            ));
          },
        ),
        floatingActionButton: FloatingActionButton(onPressed: (){
          ref.read(counterStateProvider.state).state++;


        },child: const Icon(Icons.add),
        ),
        
        
        );
        
  }
}
