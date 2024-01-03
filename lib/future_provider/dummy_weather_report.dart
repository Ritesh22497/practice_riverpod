// Future<String> fetchWeatherReport() async {
//   return await Future.delayed(
//     const Duration(seconds: 3),
//     () => '33℃'
//   );
// }
Future<String> fetchWeatherReport(String city) async {
  return await Future.delayed(
    const Duration(seconds: 3),
    () => 'city: $city |Temp: 33℃'
  );
}
