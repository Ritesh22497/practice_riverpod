Stream<int>fetchNumber(){
  return Stream<int>.periodic(
    const Duration(seconds: 1),(number)=>number,
  ).take(100);
}