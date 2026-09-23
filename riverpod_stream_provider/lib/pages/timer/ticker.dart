class Ticker {
  const Ticker();

  Stream<int> ticks({required int ticks}) =>
      Stream.periodic(Duration(seconds: 1), (t) => ticks - t - 1).take(ticks);
}
