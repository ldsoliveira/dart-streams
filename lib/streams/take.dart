Future<void> main() async {
  final interval = Duration(seconds: 2);
  var stream = Stream<int>.periodic(interval, callback);

  /// Limits the stream to it's first 5 values
  stream = stream.take(5);

  /// Await for
  await for (final i in stream) {
    print(i);
  }
}

int callback(int value) => (value + 1) * 2;