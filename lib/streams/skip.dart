Future<void> main() async {
  final interval = Duration(seconds: 2);
  var stream = Stream<int>.periodic(interval, callback);

  /// Limits the stream to it's first 5 values but skips the first 2
  stream = stream.take(5).skip(2);

  /// Await for
  await for (final i in stream) {
    print(i);
  }
}

int callback(int value) => (value + 1) * 2;