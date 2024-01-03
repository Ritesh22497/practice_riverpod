import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice_riverpod/change_notifier_provider/our_change_notifier_provider_screen.dart';
import 'package:practice_riverpod/riverpod_multiuse.dart';

import 'future_provider/our_future_provider.dart';
import 'provider/providers.dart';
import 'services/Screen/home_Screen.dart';
import 'state_notifier_provider/our_state_notifier_screen.dart';
import 'state_provider/our_state_provider.dart';
import 'stream_provider/our_stream_provider.dart';


void main() {
  runApp(const ProviderScope(child:  MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

