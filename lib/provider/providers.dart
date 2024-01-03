import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice_riverpod/change_notifier_provider/user.dart';
import 'package:practice_riverpod/future_provider/dummy_weather_report.dart';
import 'package:practice_riverpod/services/state/post_state.dart';
import 'package:practice_riverpod/state_notifier_provider/counter_notifier.dart';
import 'package:practice_riverpod/stream_provider/fetch_number.dart';

final stringProvider = StateProvider<String>((ref) {
  return "flutter riverpod";
});

final stringProvider2 = Provider<String>((ref) {
  return "flutter riverpod 2";
});

final counterStateProvider = StateProvider<int>((ref) {
  return 0;
});

// final weatherProvider = FutureProvider.autoDispose<String>((ref) async {
//   return fetchWeatherReport();
// });

// final weatherProvider = FutureProvider<String>((ref) async {
//   return fetchWeatherReport();
// });

// .family modifier

final weatherProvider =
    FutureProvider.autoDispose.family<String, String>((ref, cityName) async {
  return fetchWeatherReport(cityName);
});

final numbersProvider = StreamProvider<int>((ref) {
  return fetchNumber();
});

final counterProvider = StateNotifierProvider<CounterNotifier, int>((ref) {
  return CounterNotifier();
});
final userProvider = ChangeNotifierProvider<User>((ref) {
  return User();
});

//api provider start here

final postsProvider = StateNotifierProvider<PostsNotifier, PostState>((ref) {
  return PostsNotifier();
});
