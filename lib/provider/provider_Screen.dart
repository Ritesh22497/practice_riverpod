import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice_riverpod/provider/providers.dart';

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
  String ourData=  ref.read<String>(stringProvider);
    return Scaffold(
      body: Center(child:  Container(child: Text(ourData),)),
    );
  }
}
