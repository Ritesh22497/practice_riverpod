import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice_riverpod/provider/providers.dart';

class RiverpodMultiuse extends ConsumerWidget {
  const RiverpodMultiuse({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String ourData = ref.read<String>(stringProvider);
    String ourData2 = ref.read<String>(stringProvider2);
    return  Scaffold(
      body: Center(
        child: Text(ourData2),
      ),
    );
  }
}
