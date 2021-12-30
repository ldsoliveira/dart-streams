Future<void> main() async {
  final interval = Duration(seconds: 2);
  final stream = Stream<int>.periodic(interval, callback);

  /// Await for
  await for (final i in stream) {
    print(i);
  }
}

int callback(int value) => (value + 1) * 2;