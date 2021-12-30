Future<void> main() async {
  final interval = Duration(seconds: 2);
  var stream = Stream<int>.periodic(interval, callback);

  /// Limits the stream values using the given condition
  stream = stream.takeWhile((number) => number < 10);

  /// Await for
  await for (final i in stream) {
    print(i);
  }
}

int callback(int value) => (value + 1) * 2;